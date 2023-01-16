import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/create_post_controller.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CreatePostScreenController>(
          init: CreatePostScreenController(),
          builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: () {
                  _.createPost(text: _.postController.text,dateTime: DateTime.now().toString(),);

                  _.postController.clear();
                  Get.back();
                }, child: const Text("Post")),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png",
                    fit: BoxFit.contain,),
                ),
                title: const Text(
                  "Name", style: TextStyle(color: Colors.black, fontSize: 20),),
                subtitle: const Text(
                  "Name", style: TextStyle(color: Colors.grey, fontSize: 16),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _.postController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "What's on your mind",
                  ),
                  maxLines: 15,
                ),
              ),
              IconButton(onPressed: () {},
                  icon: const Icon(Icons.camera, size: 50, color: Colors.green,)),
              const SizedBox(height: 15,),
              IconButton(onPressed: ()async {await _.PostImage(context);},
                  icon: const Icon(Icons.image, size: 50, color: Colors.green,),),

            ],
          ),
        );
      }),
    );
  }
}
