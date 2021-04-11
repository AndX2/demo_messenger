// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:auth_app/repository/auth_repository.dart';
import 'package:auth_app/service/auth_service.dart';
import 'package:auth_app/repository/db_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:auth_app/repository/jwt/jwt_generator.dart';
import 'package:auth_app/auth_app.dart';
import 'package:auth_app/repository/jwt/jwt_generator_register.dart';
import 'package:auth_app/controller/auth_controller.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerJwtGenerator = _$RegisterJwtGenerator();
  final dbHelper = _$DbHelper();
  gh.factory<JwtGenerator>(() => registerJwtGenerator.createGenerator());
  gh.factory<ManagedContext>(() => dbHelper.createManagedContext());
  gh.factory<AuthRepository>(() => AuthRepository(get<ManagedContext>()));
  gh.factory<RefreshController>(() => RefreshController(get<AuthService>()));
  gh.factory<SigninController>(() => SigninController(get<AuthService>()));
  gh.factory<SignupController>(() => SignupController(get<AuthService>()));

  // Eager singletons must be registered in the right order
  gh.singleton<AuthService>(
      AuthService(get<AuthRepository>(), get<JwtGenerator>()));
  return get;
}

class _$RegisterJwtGenerator extends RegisterJwtGenerator {}

class _$DbHelper extends DbHelper {}
