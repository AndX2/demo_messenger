import 'dart:io';

import 'package:tst_msg/repository/jwt/jwt_validator.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterJwtValidator {
  JwtValidator createGenerator() {
    final env = Platform.environment;
    final publicKey = env['PUBLIC_KEY'];
    return JwtValidator(publicKey);
  }
}
