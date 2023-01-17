
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  static CollectionReference userReference =
  FirebaseFirestore.instance.collection("User");


  // ignore: unused_element
  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    bool status = false;
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password).then((value) {
        Get.snackbar("Successfully!", "You are logged in.",
            backgroundColor: Colors.purpleAccent,
            showProgressIndicator: true,
            icon:  Icon(Icons.error,color: Colors.red,),
            backgroundGradient: LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.blue,
            ]));
      });
      status = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return status;
  }
  /////////////////////////////////////
  bool? isChecked = false;

  void handelRememberMe(bool? value) {
    isChecked = value;
    SharedPreferences.getInstance().then(
          (prefs) {
        prefs.setBool("remember_me", value!);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passController.text);
      },
    );
      isChecked=value;
  }


  void loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {
          isChecked = true;

        emailController.text = _email ?? "";
        passController.text = _password ?? "";
      }
    } catch (e) {
      print(e);
    }
  }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   loadUserEmailPassword();
  }

}