import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PostScreenController extends GetxController{

  CollectionReference getReference =
  FirebaseFirestore.instance.collection("Posts");


}
