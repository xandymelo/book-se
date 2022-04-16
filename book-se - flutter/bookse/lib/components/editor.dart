import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final TextEditingController controller;
  final IconData? icon;
  final TextInputType textInput;
  final bool obscureText;

  Editor({
    required this.labeltext,
    required this.hinttext,
    required this.controller,
    required this.textInput,
    required this.obscureText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: labeltext,
          hintText: hinttext,
          fillColor: Colors.purple,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        keyboardType: this.textInput,
      ),
    );
  }
}