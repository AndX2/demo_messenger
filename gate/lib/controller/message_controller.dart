import 'dart:convert';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';

import 'package:tst_msg/service/message_service.dart';
import 'package:tst_msg/domain/message.dart';

import '../domain/frame.dart';
import '../repository/jwt/jwt_validator.dart';
import '../tst_msg.dart';

const _pingTimeout = Duration(seconds: 10);

/// Контроллер сетевого слоя WS подключения для обмена сообщениями
@lazySingleton
class MessageController extends Controller implements Recyclable {
  MessageController(
    this._messageService,
    this._jwtValidator,
  ) {
    _init();
  }

  final MessageService _messageService;

  final JwtValidator _jwtValidator;

  final List<WebSocket> connections = <WebSocket>[];

  Timer _pingTimer;

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    final socket = await WebSocketTransformer.upgrade(request.raw);
    connections.add(socket);
    socket.listen(
      (data) {
        _wsHandle(socket, data);
      },
      onDone: () => connections.remove(socket),
      cancelOnError: true,
    );

    return null;
  }

  void _init() {
    _messageService.addListener(_wsBroadcastSend);
    _startPing();
  }

  void _wsHandle(WebSocket currentSocket, dynamic data) {
    try {
      if (data is String && data == "10") {
        _onPong(currentSocket);
        return;
      }
      if (data is String && data == "9") {
        _onPing(currentSocket);
        return;
      }
      if (data is Uint8List && data.length == 1) {
        if (data.first == 0xA) _onPong(currentSocket);
        if (data.first == 0x9) _onPing(currentSocket);
        return;
      }
      final json = jsonDecode(data as String);
      final frame = Frame()..readFromMap(json as Map<String, dynamic>);
      if (frame.type == FrameType.ping) {
        currentSocket.add(jsonEncode(Frame.pong().asMap()));
      }
      if (frame.type == FrameType.message) {
        final channel = frame.headers['channel'];
        if (channel == null) {
          throw const HttpException('Отсутствует целевой канал сообщения');
        }
        final token = frame.headers['access'];
        try {
          _jwtValidator.validate(token);
        } catch (e) {
          throw const HttpException('Пользователь не авторизован');
        }
        final message = Message()
          ..readFromMap(frame.payload as Map<String, dynamic>);
        _messageService.push(
            channel, message.copiWith(created: DateTime.now().toUtc()));
      }
    } catch (e) {
      currentSocket.add(jsonEncode(Frame.closed(e.toString()).asMap()));
      connections.remove(currentSocket);
      currentSocket.close();
    }
  }

  void _wsBroadcastSend(Object data) {
    final out = json.encode(data);
    connections.forEach((socket) => socket.add(out));
  }

  void close() {
    connections.forEach((socket) => socket.close());
    _pingTimer?.cancel();
  }

  void _onPong(WebSocket currentSocket) {
    // TODO: reset watch dog timeout
  }

  void _onPing(WebSocket currentSocket) {
    currentSocket.add([0xA]);
  }

  void _startPing() {
    _pingTimer = Timer.periodic(
      _pingTimeout,
      (timer) {
        if (connections.isNotEmpty) {
          connections.forEach((socket) => socket.add([0x9]));
        }
      },
    );
  }

  @override
  void get recycledState => null;

  @override
  void restore(_) {}
}
