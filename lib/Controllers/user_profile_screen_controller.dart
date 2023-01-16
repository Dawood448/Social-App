import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


class ProfileScreenController extends GetxController {
  // cover Image Pick and Crop
  File? coverImage;
  String imageUpdateKey = "imageUpdatekey";
  PickUserCover() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        coverImage = File(croppedFile.path);
        debugPrint("image.path: ${image.path}");
        update([imageUpdateKey]);
      }
    }
  }

  Future uploadImagetoFirebaseStorageofCover(BuildContext context) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef = FirebaseStorage.instance
          .ref()
          .child("UsersCoverPhoto/")
          .child("/$fileName");
      await storageRef.putFile(coverImage!);

      /////////////////////////////////Send image url to fireStore////////////////
      String imageUrl = await storageRef.getDownloadURL();
      User? user = FirebaseAuth.instance.currentUser;
      CollectionReference usersReference =
          FirebaseFirestore.instance.collection("User");
      String uid = "";
      debugPrint("uid:$uid");
      if (user != null) {
        uid = user.uid;
      }
      debugPrint("uid:$uid");
      try {
        DocumentReference currentUserReference = usersReference.doc(uid);
        await currentUserReference.update({"coverImageUrl": imageUrl});
        return true;
      } on Exception catch (e) {
        debugPrint(e.toString());
        return false;
      }
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }

  //profile Image pic and crop of DP
  File? profileImage;
  String imageUpdateKeyOne = "imageUpdate";
  PickUserProfile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageO = await picker.pickImage(source: ImageSource.camera);
    if (imageO != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageO.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        profileImage = File(croppedFile.path);
        debugPrint("image.path: ${imageO.path}");
        update([imageUpdateKeyOne]);
      }
    }
  }

  // image upload to firebase
  Future uploadImagetoFirebaseStorageofProfile(BuildContext context) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef = FirebaseStorage.instance
          .ref()
          .child("UsersProfilePhoto/")
          .child("/$fileName");
      await storageRef.putFile(profileImage!);

      /////////////////////////////////Send image url to fireStore////////////////
      String imageUrl = await storageRef.getDownloadURL();
      User? user = FirebaseAuth.instance.currentUser;
      CollectionReference usersReference =
          FirebaseFirestore.instance.collection("User");
      String uid = "";
      debugPrint("uid:$uid");
      if (user != null) {
        uid = user.uid;
      }
      debugPrint("uid:$uid");
      try {
        DocumentReference currentUserReference = usersReference.doc(uid);
        await currentUserReference.update({"profileImageUrl": imageUrl});
        return true;
      } on Exception catch (e) {
        debugPrint(e.toString());
        return false;
      }
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }


  ///////////////////////////////////////////////////////////////////////////

//   static User? user = FirebaseAuth.instance.currentUser;
// CollectionReference userRef=FirebaseFirestore.instance.collection("User").where('uid',isEqualTo: user).get() as CollectionReference<Object?>;


}
