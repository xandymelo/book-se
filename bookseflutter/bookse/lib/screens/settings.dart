import 'package:bookse/Controller/Controllers.dart' as controller;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _titulo = 'Configurações';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            _titulo,
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ),
      ),
      body: ListTile(
        trailing: Icon(Icons.exit_to_app),
        onTap: () => _navigateToLogin(context),
        title: Text('Logout', style: TextStyle(color: Colors.purple),),
      ),
    );
  }
}

_navigateToLogin(BuildContext context) {
  return Navigator.pushNamed(context, controller.login);
}