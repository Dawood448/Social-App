import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreenController extends GetxController {
  GlobalKey<FormState> globalKey = GlobalKey();

  // controllers of SignUP
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();



  //Data send to firebase with authentication of signUP
  static CollectionReference userRef =
      FirebaseFirestore.instance.collection("User");
  Future<bool> SignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String dob,
  }) async {
    bool status = false;
    try {
      status = true;
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? currentUser = credential.user;
      if (currentUser != null) {
        DocumentReference currentUserRefrence = userRef.doc(currentUser.uid);
        Map<String, dynamic> userProfileData = {
          "name": name.capitalize,
          "phone": phone,
          "email": email,
          "uid": currentUser.uid,
          "gender":gender,
          "dob":dob,
        };
        await currentUserRefrence.set(userProfileData);
      }
      status = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        Get.snackbar("Unexpected Error", "The account already exists for this email.",
            backgroundColor: Colors.purpleAccent,
            showProgressIndicator: true,
            icon: const Icon(Icons.error,color: Colors.red,),
            backgroundGradient:const LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.blue,
            ]));
      }
    } catch (e) {
      print(e);
    }
    return status;
  }

  //image Picker for Sign Up

  File? imageFile;
  String imageUpdateKey = "";
  void SignUpImagePick() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imageFile = File(image.path);
      print(image.path);
      update([imageUpdateKey]);
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  ////////////////////////Validation for Email///////////////////////////
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Email";
    }
    if (!GetUtils.isEmail(value)) {
      return "Enter Valid Email";
    }
    return null;
  }
  ////////////////////////Validation for Password///////////////////////////
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Password";
    }
    if (value.length < 8) {
      return "Enter Valid Password";
    }
    return null;
  }
  ////////////////////////Validation for UserName///////////////////////////
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Name";
    }
    if (value.contains('[a-zA-Z]')) {
      return "Enter a Valid Name";
    }
    return null;
  }
  ////////////////////////Validation for Phone No///////////////////////////
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Phone no";
    }
    if (value.isPhoneNumber) {
      return "Enter a Valid Phone no";
    }
    return null;
  }

  //////////////////////Sign Up on pressed///////////////////////////
  onPressedSignUp() {
    Get.snackbar("Sucessfully Sign Up", "Sign Up Successful",
        animationDuration: const Duration(seconds: 3),
        backgroundColor: Colors.grey,
        colorText: Colors.white,
        padding: const EdgeInsets.all(10));
    Get.defaultDialog(
        title: "Status", content: const Text("Successfully Sign Up"));
  }
}
