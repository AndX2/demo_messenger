import 'package:uuid/uuid.dart';

import '../tst_msg.dart';

class Message extends Serializable {
  Message({
    String id,
    this.ownerId,
    this.ownerName,
    this.created,
    this.body,
    this.assets,
  }) : publicId = id ?? Uuid().v4();

  String publicId;

  String ownerId;

  String ownerName;

  DateTime created;

  String body;

  List<String> assets;

  Map<String, dynamic> toJson() {
    return {
      'publicId': publicId,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'created': created.toIso8601String(),
      'assets': assets,
      'body': body,
    };
  }

  @override
  Map<String, dynamic> asMap() => toJson();

  @override
  void readFromMap(Map<String, dynamic> object) {
    publicId = object['publicId'] as String;
    ownerId = object['ownerId'] as String;
    ownerName = object['ownerName'] as String;
    created = DateTime.parse(object['created'] as String);
    assets = ((object['assets'] ?? []) as List)
        .map<String>((item) => item.toString())
        .toList();
    body = object['body'] as String;
  }

  Message copiWith({
    String id,
    String ownerId,
    String ownerName,
    DateTime created,
    String body,
    List<String> assets,
  }) =>
      Message(
        id: id ?? publicId,
        ownerId: ownerId ?? this.ownerId,
        ownerName: ownerName ?? this.ownerName,
        created: created ?? this.created,
        body: body ?? this.body,
        assets: assets ?? this.assets,
      );
}
