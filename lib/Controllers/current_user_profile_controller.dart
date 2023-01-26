import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model Classes/User.dart';

class CurrentProfileScreenController extends GetxController{


  CollectionReference userRef=FirebaseFirestore.instance.collection("users");
  User? user=FirebaseAuth.instance.currentUser;

  Future getData() async {
    DocumentSnapshot ref = await userRef.doc(user!.uid).get();
    //UserModel data = UserModel.fromDocumentSnapshot(snapshot: ref);
    return ref;
  }

}
