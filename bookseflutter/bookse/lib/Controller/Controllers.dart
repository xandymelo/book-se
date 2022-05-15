import 'dart:js';

import 'package:bookse/screens/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:bookse/screens/home.dart';

import '../screens/login.dart';

const String homePage = 'home';
const String cadastro = 'cadastro';
const String login = 'login';

Route<dynamic> controller(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => Home());
    case cadastro:
      return MaterialPageRoute(builder: (context) => Cadastro());
    case login:
      return MaterialPageRoute(builder: (context) => Login());
    default:
      throw Exception("");
  }
}
