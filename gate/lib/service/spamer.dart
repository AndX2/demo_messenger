import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:tst_msg/service/message_service.dart';
import 'package:tst_msg/domain/message.dart';

import '../tst_msg.dart';
import 'spam_data.dart';

const _ownerId = '2d41c742-8436-4eb7-a458-4a2ab80fb7e6';
const _spamChannel = 'quotes';
const _period = Duration(seconds: 10);
const _maxShiftPeriod = 10;

/// Робот-спамер, рассылающий цитаты
@injectable
class Spamer {
  Spamer(this._messageService);

  final MessageService _messageService;

  Timer _timer;

  void start() {
    _timer = Timer.periodic(_period, (_) => _pushMessage());
  }

  void stop() {
    _timer.cancel();
  }

  void _pushMessage() {
    final quote = SpamData.list[Random().nextInt(SpamData.list.length)];
    final message = Message(
      ownerId: _ownerId,
      ownerName: 'Spamer',
      created: DateTime.now().toUtc(),
      body: quote,
      assets: [],
    );

    Future.delayed(
      Duration(seconds: Random().nextInt(_maxShiftPeriod)),
      () => _messageService.push(_spamChannel, message),
    );
  }
}
