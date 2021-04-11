import 'package:tst_msg/domain/message.dart';

import '../tst_msg.dart';

/// Тип сообщения
enum FrameType {
  message,
  ping,
  pong,
  closed,
}

extension FrameTypeExt on FrameType {
  String get value {
    switch (this) {
      case FrameType.message:
        return 'message';
        break;
      case FrameType.ping:
        return 'ping';
        break;
      case FrameType.pong:
        return 'pong';
        break;
      case FrameType.closed:
        return 'closed';
        break;
      default:
        throw const FormatException('Тип фрейма не распознан');
    }
  }

  static FrameType from(String row) {
    switch (row) {
      case 'message':
        return FrameType.message;
        break;
      case 'ping':
        return FrameType.ping;
        break;
      case 'pong':
        return FrameType.pong;
        break;
      case 'closed':
        return FrameType.closed;
        break;
      default:
        throw const FormatException('Тип фрейма не распознан');
    }
  }
}

/// Обобщенный тип для получаемых данных
class Frame extends Serializable {
  Frame({
    this.headers,
    this.type,
    this.payload,
  });

  factory Frame.pong() => Frame(type: FrameType.pong);

  factory Frame.closed(String reason) => Frame(
        type: FrameType.closed,
        payload: reason,
      );

  Map<String, String> headers;
  FrameType type;
  dynamic payload;

  @override
  Map<String, dynamic> asMap() {
    return {
      'type': type.value,
      if (headers != null) 'headers': headers,
      if (payload != null)
        'payload':
            payload is Serializable ? payload.asMap() : payload.toString(),
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    type = FrameTypeExt.from(object['type'] as String);
    if (type != FrameType.message) return;
    headers = Map<String, String>.from(object['headers'] as Map);
    payload = object['payload'];
  }
}

///
class ReplyMessage {
  ReplyMessage(
    this.channel,
    this.message,
  );
  final String channel;
  final Message message;

  Map<String, dynamic> toJson() {
    return {
      'channel': channel,
      'message': message.toJson(),
    };
  }
}
