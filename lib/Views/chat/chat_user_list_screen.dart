import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../Model Classes/user_model.dart';
import '../Screens/chat_screen.dart';

class ChatUserListScreen extends StatefulWidget {
  const ChatUserListScreen({Key? key}) : super(key: key);

  @override
  State<ChatUserListScreen> createState() => _ChatUserListScreenState();
}
class _ChatUserListScreenState extends State<ChatUserListScreen> {

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
      print("function usersList length");
      print(usersList.length);

    }).onError((error, stackTrace){
      print("$error");
    });

    return usersList;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsersListFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: getUsersListFromFirestore(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return const Center(child: Text("Error"),);
            }
            if(snapshot.hasData){
              print("if snap");print(snapshot.data!.length);
                if(snapshot.data!.isEmpty)
                  {
                    ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context,index)
                        {
                          UserModel detail=snapshot.data![index];
                          return ListTile(
                            title:Text(detail.name,style: const TextStyle(color: Colors.black),) ,
                            subtitle: Text(detail.email),
                            onTap: ()
                            {
                              final user =  types.User(
                                id: detail.uid,
                                firstName:detail.name,
                                imageUrl: detail.profileImageUrl,
                              );
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return ChatPage(receiverUser: user,);
                              }));
                            },
                          );
                        });
                  }
            }
            return  Center(child: SpinKitChasingDots(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.blue : Colors.red,
                  ),
                );
              },
            ),);
          },
        )
    );
  }
}