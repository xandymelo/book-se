import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String buttonText;
  final Function onClick;


  Botao({required this.buttonText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () => this.onClick(),
        child: Text(buttonText
        ),
      ),
    );
  }

}