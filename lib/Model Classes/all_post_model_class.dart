import 'package:cloud_firestore/cloud_firestore.dart';

class AllPostModel {
  late final String id;
  late final String post;
  late final String uid;
  late final String userImage;
  late final String postImageUrl;
  late final String dateTime;
  late final int likesCount;
  late final int commentsCount;
  // default constructor
  AllPostModel({
    required this.uid,
    required this.id,
    required this.post,
    required this.userImage,
    required this.postImageUrl,
    required this.dateTime,
    required this.likesCount,
    required this.commentsCount,

  });

  // for post creation
  AllPostModel.withoutId({
    required this.uid,
    required this.post,
    required this.userImage,
    required this.postImageUrl,
    required this.dateTime,

  });
  // when we read data from firebase this will be used for converting DocumentSnapshot to model object
  AllPostModel.fromDocumentSnapshot({required DocumentSnapshot doc}){
    Map<String,dynamic> data=doc.data() as Map<String,dynamic>;
    id=doc.id;
    uid=data["uid"]??"";
    post=data["post"];
    postImageUrl=data["postImageUrl"]??"";
    userImage=data["userImage"]??'';
    likesCount=data["likesCount"]??0;
    commentsCount=data["commentsCount"]??0;
    dateTime=data["dateTime"]??DateTime.now().toString();
  }
  ////////////////////////
  // when we read data from firebase this will be used for converting DocumentSnapshot to model object
  AllPostModel.fromFirestore( DocumentSnapshot doc)
  {
    uid=doc.get(uid);
    post=doc.get(post);
    postImageUrl=doc.get(postImageUrl);
    dateTime=doc.get(dateTime.toString());
    // userImage=data["userImage"]??'';
    // likesCount=data["likesCount"]??0;
    // commentsCount=data["commentsCount"]??0;
  }
  ///////////////////////////
  //////////////////////////////////////////
  // when we read data from firebase this will be used for converting DocumentSnapshot to model object
  AllPostModel.fromJson(Map<String,dynamic> doc,String id){
    //id=doc.id;
    uid=doc["uid"]??"";
    post=doc["post"];
    postImageUrl=doc["postImageUrl"]??"";
    userImage=doc["userImage"]??'';
    likesCount=doc["likesCount"]??0;
    commentsCount=doc["commentsCount"]??0;
    dateTime=doc["dateTime"]??DateTime.now().toString();
  }

  // this will be used to convert PostModelNew.withoutId to Map<String,dynamic>
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['post'] = post;
    data['imageUrl'] = postImageUrl;
    data['userImage'] = userImage;
    data['dateTime'] = dateTime;
    return data;
  }

}


var user={
  "id":0,
  "name":"adsad",
  "email":"wfsdfdfds",
  "uid":"asdsad",
  "dob":"dsad",
  "gender":"cscs",
  "education":"dsadsd",
  "profileImageUrl":"Adsafs",
  "coverImageUrl":"assfs",
  "date_create":"adasa",
  "date_update":"adasa",
  "phoneNumber":"adasa",
  "lat":"adasa",
  "lng":"adasa",
  "address":"adasa",

};