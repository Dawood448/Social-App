import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CurrentProfileScreenController extends GetxController{
  CollectionReference userRef=FirebaseFirestore.instance.collection("users");


}
