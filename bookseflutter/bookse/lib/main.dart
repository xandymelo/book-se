import 'package:bookse/screens/cadastro.dart';
import 'package:bookse/screens/home.dart';
import 'package:bookse/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:bookse/Controller/Controllers.dart' as controller;

import 'NavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'RobotoSlab',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.purple[800],
<<<<<<< HEAD
          )),
      home: Login(),
      onGenerateRoute: controller.controller,
=======
          )
      ),
      home: NavBar(),
>>>>>>> f978f18da36b109d7a7290f6e283842023df7d01
    );
  }
}
