import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_app/Views/Screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset("asset/logo.png",),
        nextScreen: const SignUpScreen(),
        animationDuration: const Duration(seconds: 5),
        splashIconSize: 120,disableNavigation: false,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
