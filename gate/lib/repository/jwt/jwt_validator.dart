import 'package:corsac_jwt/corsac_jwt.dart';

import 'package:tst_msg/domain/exception.dart';

/// Валидатор проверки данных в токенах доступа
class JwtValidator {
  JwtValidator(this.publicKey);
  final String publicKey;

  String validate(String accessToken) {
    final decoded = JWT.parse(accessToken);
    final signer = JWTRsaSha256Signer(publicKey: publicKey);
    final validator = JWTValidator()..issuer = 'https://dartservice.ru/auth';
    if (decoded.verify(signer)) {
      final errors = validator.validate(decoded);
      if (errors != null && errors.isNotEmpty)
        throw UserNotAuthorizedException();
      return decoded.claims['userName'] as String;
    } else {
      throw UserNotAuthorizedException();
    }
  }
}
