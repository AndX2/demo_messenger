import 'package:injectable/injectable.dart';
import 'package:aqueduct/aqueduct.dart';

import 'package:tst_msg/tst_msg.dart';
import 'package:tst_msg/service/message_service.dart';

/// Контроллер HTTP для получения данных о каналах и истории сообщений в них
@injectable
class ChannelController extends ResourceController {
  ChannelController(this._messageService);
  final MessageService _messageService;

  /// Получить список всех каналов с последними сообщениями в них
  @Operation.get()
  Future<Response> getTitles() async {
    return Response.ok(_messageService.titles);
  }

  /// Получить историю с канале
  @Operation.get('channel')
  Future<Response> getMessages(@Bind.path('channel') String channel) async {
    if (channel == null || channel.isEmpty) {
      return getTitles();
    }
    return Response.ok(_messageService.getChannelList(channel));
  }
}
