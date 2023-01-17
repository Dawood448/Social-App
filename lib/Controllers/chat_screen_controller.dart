import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Model Classes/user_model.dart';
class ChatPageController extends GetxController{

  CollectionReference userReference = FirebaseFirestore.instance.collection('User');
  Future<List<UserModel>> getUsersListFromFirestore()async{
    List<UserModel> usersList=[];
    userReference
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String,dynamic> docData=doc.data() as Map<String,dynamic>;
        usersList.add(UserModel.fromJson(docData, doc.id));
      }
      print("vbashdbc usersList.length");
      print(usersList.length);

    }).onError((error, stackTrace){
      print("$error");
    });

    return usersList;
  }

}
