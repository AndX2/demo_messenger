import 'dart:io';

import 'package:auth_app/repository/jwt/jwt_generator.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterJwtGenerator {
  JwtGenerator createGenerator() {
    final env = Platform.environment;
    final privateKey = env['PRIVATE_KEY'];
    return JwtGenerator(privateKey);
  }
}
