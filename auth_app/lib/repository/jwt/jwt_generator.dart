import 'package:corsac_jwt/corsac_jwt.dart';

class JwtGenerator {
  JwtGenerator(this.privateKey);
  final String privateKey;

  String createJwts(String userPublicId, String userName, Duration estimate) {
    final builder = JWTBuilder();
    final rowToken = builder
      ..issuer = 'https://dartservice.ru/auth'
      ..expiresAt = DateTime.now().add(estimate)
      ..setClaim('data', {
        'user': userPublicId,
        'userName': userName,
      })
      ..getToken();
    final signer = JWTRsaSha256Signer(privateKey: privateKey);
    final token = rowToken.getSignedToken(signer);
    return token.toString();
  }
}
