import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/Controllers/signup_controller.dart';
import 'package:social_app/Views/Screens/login_screen.dart';
import 'package:social_app/Widgest/text_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpScreenController>(
        init: SignUpScreenController(),
        builder: (_) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                width: Get.width,
                height: Get.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.purpleAccent,
                  ]),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0, left: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Sign-Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Form(
                        key: _.globalKey,
                        child: Column(
                          children: [
                            Kfield(
                              label: "Name",
                              hint: "Enter your name",
                              suffIcon: const Icon(Icons.person_outline),
                              controller: _.nameController,
                              val: _.validateName,
                            ),
                            Kfield(
                              label: "Email",
                              hint: "abc@gmail.com",
                              suffIcon: const Icon(Icons.email),
                              controller: _.emailController,
                              val: _.validateEmail,
                            ),
                            Kfield(
                              label: "Password",
                              suffIcon: const Icon(Icons.password),
                              controller: _.passController,
                              val: _.validatePassword,
                            ),
                            Kfield(
                              label: "Phone",
                              hint: "+92-300-1234567",
                              suffIcon: const Icon(Icons.phone),
                              controller: _.phoneController,
                            ),
                            Kfield(
                                label: "Gender",
                                suffIcon: const Icon(Icons.transgender),
                                controller: _.genderController),
                            Kfield(
                                label: "DoB",
                                suffIcon: const Icon(Icons.data_thresholding),
                                controller: _.dobController),
                          ],
                        ),
                      ),
                      Container(
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
                          onPressed: () async {
                            if (_.globalKey.currentState!.validate()) {
                              await _.SignUp(
                                name: _.nameController.text,
                                email: _.emailController.text,
                                password: _.passController.text,
                                phone: _.phoneController.text,
                                gender: _.genderController.text,
                                dob: _.dobController.text,
                              );
                              Get.offAll(const LoginScreen());
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have a account?"),
                          TextButton(
                            onPressed: () {
                              Get.to(const LoginScreen());
                            },
                            child: const Text(
                              "LOG-IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
