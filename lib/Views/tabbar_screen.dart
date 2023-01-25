import 'package:flutter/material.dart';
import 'package:social_app/Views/Screens/all_post_screen.dart';
import 'package:social_app/Views/Screens/user_profile_screen.dart';
import 'package:get/get.dart';
import '../Chat/rooms.dart';
import 'Screens/create_post_screen.dart';
import 'Screens/current_user_profile_screen.dart';
class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("youSocial",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 30),),
          actions: [
            TextButton(onPressed: (){
              Get.to(const CreatePostScreen());
            }, child: const Text("Add Post")),
            IconButton(onPressed: (){}, icon: const Icon(Icons.settings_applications_rounded,color: Colors.black,)),
          ],
          bottom:  const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home,color: Colors.black,),),
                Tab(icon: Icon(Icons.chat_outlined,color: Colors.black,)),
                Tab(icon: Icon(Icons.local_parking_rounded,color: Colors.black,)),
                Tab(icon: Icon(Icons.emoji_people,color: Colors.black,)),
              ]),
        ),
        body:
        const TabBarView(
                  children: [
                    PostScreen(),
                    RoomsPage(),
                    ProfileScreen(),
                    CurrentProfileScreen(),
              ]),
      ),
    );
  }
}
