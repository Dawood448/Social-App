import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PostScreenController extends GetxController{

  CollectionReference getReference =
  FirebaseFirestore.instance.collection("Posts");
  CollectionReference getUserRef =
  FirebaseFirestore.instance.collection("users");




}
