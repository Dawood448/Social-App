import 'package:flutter/material.dart';

import '../../Controllers/comment_screen_controller.dart';
class CommentScreen extends StatelessWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.comment_bank_outlined))],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

