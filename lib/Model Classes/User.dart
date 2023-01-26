import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    required this.coverImageUrl,
    required this.createdAt,
    required this.lastSeen,
    required this.imageUrl,
    required this.profileImageUrl,
    required this.updatedAt,
    required this.metadata,
  });
  late final String coverImageUrl;
  late final Timestamp createdAt;
  late final String profileImageUrl;
  late final Timestamp lastSeen;
  late final String imageUrl;
  late final Timestamp updatedAt;
  late final Metadata metadata;

  UserModel.fromJson(Map<String, dynamic> json) {
    coverImageUrl = json['coverImageUrl'] ?? "";
    profileImageUrl = json['profileImageUrl'] ?? "";
    createdAt = json['createdAt'];
    lastSeen = json['lastSeen'];
    imageUrl = json['profileImageUrl'] ?? "";
    updatedAt = json['updatedAt'];
    metadata = Metadata.fromJson(json['metadata'] ?? {});
  }

  UserModel.fromDocumentSnapshot({required DocumentSnapshot snapshot}) {
    Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
    coverImageUrl = json['coverImageUrl'] ?? "";
    profileImageUrl = json['profileImageUrl'] ?? "";
    createdAt = json['createdAt'];
    lastSeen = json['lastSeen'];
    imageUrl = json['profileImageUrl'] ?? "";
    updatedAt = json['updatedAt'];
    metadata = Metadata.fromJson(json['metadata'] ?? {});
  }
}

class Metadata {
  Metadata({
    required this.name,
    required this.dob,
    required this.email,
    required this.phone,
    required this.gender,
    required this.uid,
  });
  late final String name;
  late final String dob;
  late final String email;
  late final String phone;
  late final String gender;
  late final String uid;

  Metadata.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    dob = json['dob'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    gender = json['gender'] ?? "";
    uid = json['uid'] ?? "";
  }
  Metadata.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    name = documentSnapshot['name'] ?? "";
    dob = documentSnapshot['dob'] ?? "";
    email = documentSnapshot['email'] ?? "";
    phone = documentSnapshot['phone'] ?? "";
    gender = documentSnapshot['gender'] ?? "";
    uid = documentSnapshot['uid'] ?? "";
  }
}
