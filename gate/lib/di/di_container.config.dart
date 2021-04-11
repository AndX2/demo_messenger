// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:tst_msg/controller/access_validator.dart';
import 'package:tst_msg/controller/channel_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tst_msg/repository/jwt/jwt_validator.dart';
import 'package:tst_msg/controller/message_controller.dart';
import 'package:tst_msg/service/message_service.dart';
import 'package:tst_msg/repository/jwt/jwt_validator_register.dart';
import 'package:tst_msg/service/spamer.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerJwtValidator = _$RegisterJwtValidator();
  gh.factory<JwtValidator>(() => registerJwtValidator.createGenerator());
  gh.factory<Spamer>(() => Spamer(get<MessageService>()));
  gh.factory<AccessValidator>(() => AccessValidator(get<JwtValidator>()));
  gh.factory<ChannelController>(() => ChannelController(get<MessageService>()));
  gh.lazySingleton<MessageController>(
      () => MessageController(get<MessageService>(), get<JwtValidator>()));

  // Eager singletons must be registered in the right order
  gh.singleton<MessageService>(MessageService());
  return get;
}

class _$RegisterJwtValidator extends RegisterJwtValidator {}
