import 'package:uuid/uuid.dart';

import 'package:auth_app/auth_app.dart';
import 'package:auth_app/domain/refresh_token.dart';

class User extends ManagedObject<_User> implements _User {
  @override
  void willInsert() {
    publicId = Uuid().v4();
    created = DateTime.now();
    updated = DateTime.now();
    super.willInsert();
  }

  @override
  void willUpdate() {
    updated = DateTime.now();
    super.willUpdate();
  }

  @override
  Map<String, dynamic> asMap() {
    return super.asMap()..remove('id');
  }
}

@Table(name: 'table_user')
class _User {
  @primaryKey
  int id;

  @Column(indexed: true)
  String name;

  @Column(indexed: true)
  String publicId;

  @Column(indexed: true)
  DateTime created;

  @Column(indexed: true)
  DateTime updated;

  ManagedSet<RefreshToken> tokenList;
}
