import 'package:flutter/material.dart';
class RowText extends StatelessWidget {
  final String text;
  final String textA;
  const RowText({Key? key,
    required this.text,
    required this.textA,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,style: const TextStyle(color: Colors.grey,fontSize: 18,),),
          Text(textA,style: const TextStyle(color: Colors.black,fontSize: 20),),
        ],
      ),
    );
  }
}

///////////////////////////
class DivWidget extends StatelessWidget {
  const DivWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:const  [
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}
