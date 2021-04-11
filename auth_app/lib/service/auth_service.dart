import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:auth_app/repository/auth_repository.dart';
import 'package:auth_app/domain/user.dart';
import 'package:uuid/uuid.dart';

import 'package:auth_app/domain/refresh_token.dart';
import 'package:auth_app/repository/jwt/jwt_generator.dart';

const _accessTokenLifeTime = Duration(minutes: 30);
const _refreshTokenLifeTime = Duration(days: 90);

@singleton
class AuthService {
  AuthService(this._authRepository, this._generator);

  final AuthRepository _authRepository;
  final JwtGenerator _generator;

  Future<bool> isUserNameExist(String name) async {
    return (await _authRepository.getUserByName(name)) != null;
  }

  Future<User> signUp(String name) async {
    if (await isUserNameExist(name)) {
      throw UserAlreadyExistException();
    }
    final user = User()..name = name;
    return _authRepository.saveUser(user);
  }

  Future<User> signIn(String name) async {
    return _authRepository.getUserByName(name);
  }

  Future<TokenPair> createTokenPair(User user) async {
    final refresh = RefreshToken()
      ..user = user
      ..value = Uuid().v4();
    final savedRefresh = await _authRepository.saveRefreshToken(refresh);
    final accessToken =
        _generator.createJwts(user.publicId, user.name, _accessTokenLifeTime);
    return TokenPair(savedRefresh, accessToken);
  }

  Future<TokenPair> refresh(String refresh) async {
    final RefreshToken existToken =
        await _authRepository.getRefreshTokenByValue(refresh);

    if (existToken == null) {
      throw UserNotFoundException();
    }

    if (existToken.created
        .add(_refreshTokenLifeTime)
        .isBefore(DateTime.now())) {
      throw TokenIsExpireException();
    }

    final newRefresh = RefreshToken()
      ..user = existToken.user
      ..value = Uuid().v4();

    final savedRefresh = await _authRepository.saveRefreshToken(newRefresh);
    final accessToken = _generator.createJwts(
      newRefresh.user.publicId,
      newRefresh.user.name,
      _accessTokenLifeTime,
    );
    return TokenPair(savedRefresh, accessToken);
  }
}

class UserAlreadyExistException implements Exception {
  @override
  String toString() => 'Пользователь с таким именем уже существует';
}

class UserNotFoundException implements Exception {
  @override
  String toString() => 'Пользователь не авторизован';
}

class TokenIsExpireException implements Exception {
  @override
  String toString() => 'Срок действия токена истек';
}
