import 'package:injectable/injectable.dart';

import 'package:auth_app/auth_app.dart';
import 'package:auth_app/domain/user.dart';

import 'package:auth_app/domain/refresh_token.dart';

@injectable
class AuthRepository {
  AuthRepository(this._managedContext);

  final ManagedContext _managedContext;

  Future<User> getUserByName(String name) async {
    final query = Query<User>(_managedContext)
      ..where((user) => user.name).equalTo(name);
    return query.fetchOne();
  }

  Future<User> saveUser(User user) async {
    final savedUser = await _managedContext.insertObject<User>(user);
    return savedUser;
  }

  Future<RefreshToken> getRefreshTokenByValue(String refresh) async {
    final query = Query<RefreshToken>(_managedContext)
      ..where((token) => token.value).equalTo(refresh);
    final exist = await query.fetchOne();
    await query.delete();
    return exist;
  }

  Future<RefreshToken> saveRefreshToken(RefreshToken token) async {
    final savedToken = await _managedContext.insertObject<RefreshToken>(token);
    return savedToken;
  }
}
