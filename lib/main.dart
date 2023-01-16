import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_app/Views/Screens/create_post_screen.dart';
import 'package:social_app/Views/Screens/login_screen.dart';
import 'package:social_app/Views/Screens/all_post_screen.dart';
import 'package:social_app/Views/Screens/signup_screen.dart';
import 'package:social_app/Views/tabbar_screen.dart';
import 'package:social_app/Views/Screens/user_profile_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'Views/add_post_screen.dart';
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignUpScreen(),
    );
  }
}
