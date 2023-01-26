import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/current_user_profile_controller.dart';
import '../../Model Classes/User.dart';
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
            body: FutureBuilder(
              future: _.getData(),
              builder: (context, snapshot)
              {
                if(snapshot.hasData)
                  {
                    UserModel obj = UserModel.fromDocumentSnapshot(snapshot: snapshot.data);
                    return  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RowText(text: "First-Name",textA:obj.metadata.name),
                            const DivWidget(),
                            RowText(text: "DoB",textA: obj.metadata.dob),
                            const DivWidget(),
                            RowText(text: "Gender",textA: obj.metadata.gender),
                            const DivWidget(),
                            RowText(text: "E-mail",textA: obj.metadata.email),
                            const DivWidget(),
                            RowText(text: "Phone-Number",textA: obj.metadata.phone),
                          ],
                        ),
                      ],
                    );
                  }else{
                  return const CircularProgressIndicator();
                }
              }
            ),
          );
        },
      ),
    );
  }
}

