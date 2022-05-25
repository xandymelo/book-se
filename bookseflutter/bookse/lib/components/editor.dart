import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final TextEditingController controller;
  final IconData? icon;
  final Function(String) onChanged;
  final TextInputType textInput;
  final bool obscureText;
  final Color colorBorder;
  late Function(String) onSubmited;

  Editor({
    required this.labeltext,
    required this.hinttext,
    required this.controller,
    required this.textInput,
    required this.obscureText,
    required this.colorBorder,
    this.icon,
    required this.onSubmited,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Visibility(
              child: Text('Este Campo é obrigatório!', style: TextStyle(color: Colors.red),),
              visible: this.colorBorder == Colors.red ? true : false
            ),
          ),
          TextField(
            onChanged: onChanged,
            textInputAction: TextInputAction.go,
            onSubmitted: onSubmited,
            obscureText: obscureText,
            enableSuggestions: false,
            controller: controller,
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: this.colorBorder)
              ),
              icon: icon != null ? Icon(icon) : null,
              labelText: labeltext,
              hintText: hinttext,
              labelStyle: TextStyle(color: Colors.black,),
              fillColor: Colors.black,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: this.colorBorder, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),

            keyboardType: this.textInput,
          ),
        ],
      ),
    );
  }
}
