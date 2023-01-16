import 'package:flutter/material.dart';
class Kbutoon extends StatelessWidget {
  const Kbutoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(1000, 500,),
          bottomLeft:Radius.elliptical(1200,500),),
        gradient: LinearGradient(colors:
        [
          Colors.blue,
          Colors.purpleAccent,
        ]
        ),
      ),
    );
  }
}
