import 'package:flutter/material.dart';

class Kfield extends StatelessWidget {
  final String? hint, label;
  Icon suffIcon;
  TextEditingController controller;
  String? Function(String?)? val;
  Kfield(
      {Key? key,
       this.hint,
      required this.label,
      required this.suffIcon,
      required this.controller,
      this.val,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        validator: val,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: hint,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          prefixIcon: suffIcon,
        ),
      ),
    );
  }
}
