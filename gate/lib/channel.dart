import 'package:tst_msg/tst_msg.dart';
import 'package:tst_msg/di/di_container.dart';
import 'package:tst_msg/service/spamer.dart';
import 'package:tst_msg/controller/channel_controller.dart';
import 'package:tst_msg/controller/message_controller.dart';
import 'package:tst_msg/controller/access_validator.dart';

/// Класс приложения
class TstMsgChannel extends ApplicationChannel {
  Spamer _spamer;

  @override
  Future prepare() async {
    initDi();
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    _spamer = getIt<Spamer>();
    _spamer.start();
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
        .route('/channel/[:channel]')
        // ignore: unnecessary_lambdas
        // .link(() => getIt<AccessValidator>())
        // ignore: unnecessary_lambdas
        .link(() => getIt<ChannelController>());

    // ignore: unnecessary_lambdas
    router.route("/ws").link(() => getIt<MessageController>());

    return router;
  }

  @override
  Future close() {
    _spamer.stop();
    getIt<MessageController>().close();
    return super.close();
  }
}
