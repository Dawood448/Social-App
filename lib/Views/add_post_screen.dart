import 'package:flutter/material.dart';
class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 250,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text("What's on your mind?")),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.image_search_rounded,
                      color: Colors.green,
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
