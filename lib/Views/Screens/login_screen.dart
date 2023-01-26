import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/Controllers/login_screen-controller.dart';
import 'package:social_app/Views/Screens/signup_screen.dart';
import 'package:social_app/Views/tabbar_screen.dart';
import 'package:social_app/Widgest/text_form_widget.dart';
import 'package:get/get.dart';
import '../../Widgest/triangle.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
        init: LoginScreenController(),
        builder: (_) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: Get.width,
                    height: Get.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.blue,
                        Colors.purpleAccent,
                      ]),
                    ),
                    child: const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    child: Container(
                      width: Get.width,
                      height: 430,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(
                            1000,
                            500,
                          ),
                          bottomLeft: Radius.elliptical(1200, 500),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, bottom: 10),
                            child: Text(
                              "Hello!",
                              style: TextStyle(
                                  color: Colors.purpleAccent,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Kfield(
                            controller: _.emailController,
                            label: "Email",
                            hint: "adc@gmail.com",
                            suffIcon: const Icon(Icons.email),
                          ),
                          Kfield(
                              label: "Password",
                              suffIcon: const Icon(Icons.password),
                              controller: _.passController),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text("Remember Me",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                                Checkbox(
                                  activeColor: Colors.blue,
                                  value: _.isChecked,
                                  onChanged: _.handelRememberMe,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 60,
                    child: CustomPaint(
                      painter: DrawTriangleShape(),
                      child: const SizedBox(
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 80,
                    child: Container(
                      height: 80,
                      width: Get.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Colors.purpleAccent,
                          Colors.blue,
                        ]),
                      ),
                      child: TextButton(
                        onPressed: ()async {
                          bool status=await _.loginUser(
                              email: _.emailController.text,
                              password: _.passController.text);
                          if(status)
                          {
                              Get.to(const TabBarScreen());
                          }
                          else{
                            Get.snackbar("Error", "Try Valid Credentials",
                                backgroundColor: Colors.purpleAccent,
                                showProgressIndicator: true,
                                icon: const Icon(Icons.error,color: Colors.red,),
                                backgroundGradient:const LinearGradient(colors: [
                                  Colors.purpleAccent,
                                  Colors.blue,
                                ]));
                          }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 115,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("New User?"),
                          TextButton(
                            onPressed: () {
                              Get.to(SignUpScreen());
                            },
                            child: const Text(
                              "SIGNUP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
