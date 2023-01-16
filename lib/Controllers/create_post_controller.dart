import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreenController extends GetxController {
  TextEditingController postController = TextEditingController();
  CollectionReference postRef = FirebaseFirestore.instance.collection("Posts");
  String? imageUrl;
  CroppedFile? croppedFile;
  ///////////////////////////////////////////
  Future createPost({
    required String text,
    required String dateTime,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = "";
    if (user != null) {
      uid = user.uid;
    }
    if (croppedFile != null) {
      postImage = File(croppedFile?.path ?? "");
      imageUrl = await uploadImagetoFirebaseStorageofPosts();
      update([imageUpdateKey, imageUrl!]);
      Map<String, dynamic> postData = {
        "post": text,
        "uid": uid,
        "dateTime": dateTime,
        "postImageUrl": imageUrl,
      };
      postRef
          .add(postData)
          .then((value) => print("Success"))
          .onError((error, stackTrace) => print("Error is ${error}"));
    }
  }

///////////////////////////////////////////////////////////////////
  File? postImage;
  String imageUpdateKey = "imageUpdate";

  PostImage(context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      croppedFile = await ImageCropper().cropImage(
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
    }
  }

  //////////////////////////////////////////////////////////////
  Future<String> uploadImagetoFirebaseStorageofPosts() async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef = FirebaseStorage.instance
          .ref()
          .child("UsersPostsPhoto/")
          .child("/$fileName");
      //     User? user = FirebaseAuth.instance.currentUser;
      //     CollectionReference usersReference =
      //     FirebaseFirestore.instance.collection("Posts");
      //     String uid = "";
      //     debugPrint("uid:$uid");
      //     if (user != null) {
      //       uid = user.uid;
      //     }
      //     debugPrint("uid:$uid");
      //     try {
      //       DocumentReference currentUserReference = usersReference.doc(uid);
      //       await currentUserReference.update({"PostImageUrl": imageUrl});
      //       return true;
      //     } on Exception catch (e) {
      //       debugPrint(e.toString());
      //       return false;
      //     }
      //   } on FirebaseException catch (e) {
      //     debugPrint(e.message);
      //   }
      await storageRef.putFile(postImage!);
      /////////////////////////////////Send image url to fireStore////////////////
      imageUrl = await storageRef.getDownloadURL();
      return imageUrl ?? "";
    } catch (e) {}
    return ' ';
  }
}
