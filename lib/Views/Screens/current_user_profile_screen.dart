import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/current_user_profile_controller.dart';
import '../../Widgest/row_widget.dart';

class CurrentProfileScreen extends StatelessWidget {
  const CurrentProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CurrentProfileScreenController>(
        init: CurrentProfileScreenController(),
        builder: (_) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                    RowText(text: "First-Name",textA: "Muhammad Dawood Zafar"),
                    DivWidget(),
                    RowText(text: "DoB",textA: "02-02-2001"),
                    DivWidget(),
                    RowText(text: "Gender",textA: "Male"),
                    DivWidget(),
                    RowText(text: "E-mail",textA: "dawoodqurashi44@gmail.com"),
                    DivWidget(),
                    RowText(text: "Phone-Number",textA: "+92-34224160086"),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

