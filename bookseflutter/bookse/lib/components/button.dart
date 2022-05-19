import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String buttonText;
  final Function onClick;
  final IconData? icon;

  Botao({required this.buttonText, required this.onClick, this.icon});

  @override
  Widget build(BuildContext context) {
        return SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        height: 60,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          onPressed: () => this.onClick(),
          child: Row(children: [
            Center(child: Text(buttonText)),
            Spacer(),
            Icon(icon),
          ],),
        ),
      );
  }
}
