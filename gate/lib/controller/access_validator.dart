import 'package:injectable/injectable.dart';
import 'package:aqueduct/aqueduct.dart';

import 'package:tst_msg/tst_msg.dart';
import 'package:tst_msg/repository/jwt/jwt_validator.dart';

/// Контроллер авторизации
@injectable
class AccessValidator extends Controller {
  AccessValidator(this._jwtValidator);
  final JwtValidator _jwtValidator;

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    final token =
        request.raw.headers.value('Authorization')?.replaceAll('Bearer ', '');
    if (token == null || token.isEmpty) {
      return Response.unauthorized();
    }

    String ownerName;

    try {
      ownerName = _jwtValidator.validate(token);
    } catch (_) {
      return Response.unauthorized();
    }

    request.attachments['ownerName'] = ownerName;
    return request;
  }
}
