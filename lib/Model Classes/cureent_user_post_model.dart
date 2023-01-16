import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentUserPostModel {
  CurrentUserPostModel({
    required this.dateTime,
    required this.post,
    required this.id,
    required this.uid,
  });

  late final String dateTime;
  late final String post;
  late final String id;
  late final String uid;

  CurrentUserPostModel.fromJson(Map<String, dynamic> json, String docId) {
    dateTime = json['DateTime'] ?? "";
    post = json['Post'] ?? "";
    uid = json['User-Id'] ?? "";
    id = docId;
  }

  CurrentUserPostModel.fromDocumentSnapshot({required DocumentSnapshot snapshot}) {
    id = snapshot.id;
    dateTime = snapshot['DateTime'] ?? "";
    post = snapshot['body'] ?? "";
    uid = snapshot['User-Id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['DateTime'] = dateTime;
    _data['body'] = post;
    _data['id'] = id;
    _data['User-Id'] = uid;
    return _data;
  }

  Map<String, dynamic> toJsonWithoutId() {
    final _data = <String, dynamic>{};
    _data['DateTime'] = dateTime;
    _data['body'] = post;
    _data['User-Id'] = uid;
    return _data;
  }
}
