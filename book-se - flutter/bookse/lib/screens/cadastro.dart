import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/editor.dart';

const _h1 = 'Crie sua conta';
const _campoNome = 'Primeiro Nome';
const _dicaCampoNome = 'João';
const _campoSegundoNome = 'último Nome';
const _dicaCampoSegundoNome = 'Farias';
const _campoUsername = 'Username';
const _dicaCampoUsername = 'joaoGrifinória';
const _campoEmail = 'E-mail';
const _dicaCampoEmail = 'seuemail@email.com';
const _campoConfirmaEmail = 'Confirme seu E-mail';
const _campoPassword = 'Senha';
const _dicaCampoPassword = '******';
const _campoConfirmaPassword = 'Confirme sua Senha';
const _textoBotao = 'Criar Conta';

class Cadastro extends StatelessWidget {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _segundoNome = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _confirmaEmail = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmaPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          centerTitle: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              _h1,
              style: TextStyle(
                fontSize: 44,
              ),
            ),
            Editor(
              labeltext: _campoNome,
              hinttext: _dicaCampoNome,
              controller: _nome,
              textInput: TextInputType.name,
              obscureText: false,
            ),
            Editor(
              labeltext: _campoSegundoNome,
              hinttext: _dicaCampoSegundoNome,
              controller: _segundoNome,
              textInput: TextInputType.name,
              obscureText: false,
            ),
            Editor(
              labeltext: _campoUsername,
              hinttext: _dicaCampoUsername,
              controller: _userName,
              textInput: TextInputType.name,
              obscureText: false,
            ),
            Editor(
              labeltext: _campoEmail,
              hinttext: _dicaCampoEmail,
              controller: _email,
              textInput: TextInputType.name,
              obscureText: false,
            ),
            Editor(
              labeltext: _campoConfirmaEmail,
              hinttext: _dicaCampoEmail,
              controller: _confirmaEmail,
              textInput: TextInputType.name,
              obscureText: false,
            ),
            Editor(
              labeltext: _campoPassword,
              hinttext: _dicaCampoPassword,
              controller: _password,
              textInput: TextInputType.visiblePassword,
              obscureText: false,
            ),
            Editor(
              labeltext: _campoConfirmaPassword,
              hinttext: _dicaCampoPassword,
              controller: _confirmaPassword,
              textInput: TextInputType.visiblePassword,
              obscureText: false,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Botao( buttonText: _textoBotao, onClick: () {},),
            ),
          ],
        ),
      ),
    );
  }
}
