class UserModelforPosts {
  UserModelforPosts({
    required this.id,
    required this.name,
    required this.email,
    required this.uid,
    required this.dob,
    required this.gender,
    required this.education,
    required this.userProfileImageURL,
    required this.coverImageUrl,
    required this.dateCreate,
    required this.dateUpdate,
    required this.phoneNumber,
    required this.lat,
    required this.lng,
    required this.address,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String uid;
  late final String dob;
  late final String gender;
  late final String education;
  late final String userProfileImageURL;
  late final String coverImageUrl;
  late final String dateCreate;
  late final String dateUpdate;
  late final String phoneNumber;
  late final String lat;
  late final String lng;
  late final String address;

  UserModelforPosts.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??"";
    email = json['email']??"";
    uid = json['uid']??"";
    dob = json['dob']??"";
    gender = json['gender']??"";
    education = json['education']??"";
    userProfileImageURL = json['userProfileImageURL']??"";
    coverImageUrl = json['coverImageUrl']??"";
    dateCreate = json['date_create']??"";
    dateUpdate = json['date_update']??"";
    phoneNumber = json['phoneNumber']??"";
    lat = json['lat']??"";
    lng = json['lng']??"";
    address = json['address']??"";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['uid'] = uid;
    data['dob'] = dob;
    data['gender'] = gender;
    data['education'] = education;
    data['userProfileImageURL'] = userProfileImageURL;
    data['coverImageUrl'] = coverImageUrl;
    data['date_create'] = dateCreate;
    data['date_update'] = dateUpdate;
    data['phoneNumber'] = phoneNumber;
    data['lat'] = lat;
    data['lng'] = lng;
    data['address'] = address;
    return data;
  }
}