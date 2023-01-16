import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/all_post_screen_controller.dart';
import '../../Model Classes/all_post_model_class.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<PostScreenController>(
          init: PostScreenController(),
          builder: (_) {
                    return FutureBuilder
                      (
                      future: _.getReference.get(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData)
                          {
                            return
                                  ListView.separated(
                                      itemCount: snapshot.data!.docs.length,
                                      separatorBuilder: (context, index) {
                                        return Divider(
                                          thickness: 15,
                                          color: Colors.grey.shade400,
                                        );
                                      },
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (ctx, index) {
                                        AllPostModel details=AllPostModel.fromDocumentSnapshot(doc: snapshot.data!.docs[index]);
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Name",
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16),
                                                      ),
                                                      Text(
                                                        details.dateTime,
                                                        style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                child: Text(details.post,textAlign: TextAlign.justify,),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              height: Get.height * 0.4,
                                              width: Get.width,
                                              child: Image.network(details.postImageUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                        return const CircularProgressIndicator();
                      }
                    );
          }),
    );
  }
}
