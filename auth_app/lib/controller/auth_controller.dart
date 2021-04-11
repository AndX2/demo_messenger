import 'package:injectable/injectable.dart';

import 'package:auth_app/auth_app.dart';
import 'package:auth_app/service/auth_service.dart';

import 'package:auth_app/domain/user.dart';

class Name extends Serializable {
  String name;

  @override
  Map<String, dynamic> asMap() {
    return null;
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    name = object['name'].toString();
  }
}

@injectable
class SignupController extends ResourceController {
  SignupController(this._authService);

  final AuthService _authService;

  @Operation.post()
  Future<Response> signUp(@Bind.body() Name name) async {
    final user = await _authService.signUp(name.name).catchError(
          (e) => throw Response.badRequest(body: e.toString()),
          test: (e) => e is UserAlreadyExistException,
        );
    return _addToken(
        Response.created('/profile/${user.publicId}', body: user), user);
  }

  Future<Response> _addToken(Response response, User user) async {
    final tokenPair = await _authService.createTokenPair(user);
    return response
      ..headers = {
        'Authorization': tokenPair.accessToken,
        'refresh': tokenPair.refreshToken.value,
      };
  }
}

@injectable
class SigninController extends ResourceController {
  SigninController(this._authService);

  final AuthService _authService;

  @Operation.post()
  Future<Response> signIn(@Bind.body() Name name) async {
    final user = await _authService.signIn(name.name);
    if (user == null) {
      throw Response.notFound();
    }

    return _addToken(Response.ok(user), user);
  }

  Future<Response> _addToken(Response response, User user) async {
    final tokenPair = await _authService.createTokenPair(user);
    return response
      ..headers = {
        'Authorization': tokenPair.accessToken,
        'refresh': tokenPair.refreshToken.value,
      };
  }
}

@injectable
class RefreshController extends ResourceController {
  RefreshController(this._authService);

  final AuthService _authService;

  @Operation.get()
  Future<Response> example() async => Response.ok({'key': 'value'});

  @Operation.post()
  Future<Response> refresh(@Bind.header('Authorization') String refresh) async {
    final tokenPair = await _authService
        .refresh(refresh)
        .catchError((e) => throw Response.unauthorized());

    return Response.ok(null)
      ..headers = {
        'Authorization': tokenPair.accessToken,
        'refresh': tokenPair.refreshToken.value,
      };
  }
}
