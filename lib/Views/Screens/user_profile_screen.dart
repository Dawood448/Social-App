import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/user_profile_screen_controller.dart';
import '../../Model Classes/all_post_model_class.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(
        init: ProfileScreenController(),
        builder: (_) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  FutureBuilder(
                    future: null,
                    builder: (context, snapshot) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GetBuilder<ProfileScreenController>(
                              id: _.imageUpdateKey,
                              builder: (logic) {
                                return GestureDetector(
                                  onTap: () async {
                                    await logic.PickUserCover();
                                    logic.uploadImagetoFirebaseStorageofCover(context);
                                  },
                                  child: SizedBox(
                                    width: Get.width,
                                    height: Get.height * .25,
                                    child: logic.coverImage != null
                                        ? Image.file(
                                            logic.coverImage!,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"),
                                  ),
                                );
                              }),
                          Positioned(
                            bottom: -50,
                            left: 20,
                            child: GetBuilder<ProfileScreenController>(
                                id: _.imageUpdateKeyOne,
                                builder: (lo) {
                                  return GestureDetector(
                                    onTap: () async {
                                      await lo.PickUserProfile();
                                      lo.uploadImagetoFirebaseStorageofProfile(context);
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(80)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(80),
                                        child: lo.profileImage != null
                                            ? Image.file(
                                                lo.profileImage!,
                                                fit: BoxFit.fitHeight,
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: Image.network(
                                                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png",
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      );
                    }
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  Divider(
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(
                    height: Get.height * 0.48,
                    width: Get.width,
                    //color: Colors.yellow,
                    child: const Sparate(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class Sparate extends StatelessWidget {
  const Sparate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(
        init: ProfileScreenController(),
        builder: (_) {
          return FutureBuilder(
              future: _.postRef.where('uid', isEqualTo: _.user!.uid).get(),
              builder: (context, snapshot) {
          if(snapshot.hasData)
            {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (ctx, index) {
                    AllPostModel obj=AllPostModel.fromDocumentSnapshot(doc: snapshot.data!.docs[index]);
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text(
                                    "obj.name",
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  Text(
                                    obj.dateTime,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          height: Get.height * 0.3,
                          width: Get.width,
                          child: Image.network(
                            obj.postImageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Likes Count"),
                              Text("Commennts Count"),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.thumb_up,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.mode_comment_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.share,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            }
          else
            {
              return const CircularProgressIndicator();
            }
        });
    });
  }
}
