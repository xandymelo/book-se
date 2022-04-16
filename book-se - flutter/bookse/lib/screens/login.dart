import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/editor.dart';

const _titulo = '• Book-se •';
const _nomeCampoEmail = 'E-mail';
const _dicaCampoEmail = 'seu_email@email.com';
const _nomeCampoSenha = 'Senha';
const _dicaCampoSenha = '*******';
const _textoBotaoLogin = 'Login';
const _textoHyperLinkCreateAccount = 'Criar uma conta';
const _textoHyperLinkForgotPassword = 'Esqueci minha senha';
const _textoBoasVidas = "Bem Vindo!";
const _textoPrivacy = "Privacidade";

class Login extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          centerTitle: true,
          title: Text(
            _titulo,
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                _textoBoasVidas,
                style: TextStyle(
                  fontSize: 44,
                ),
              ),
            ),
            Editor(
              labeltext: _nomeCampoEmail,
              hinttext: _dicaCampoEmail,
              controller: _email,
              textInput: TextInputType.emailAddress,
              obscureText: false,
            ),
            Editor(
              labeltext: _nomeCampoSenha,
              hinttext: _dicaCampoSenha,
              controller: _senha,
              textInput: TextInputType.visiblePassword,
              obscureText: true,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(_textoBotaoLogin),
              ),
            ),
            InkWell(
              onTap: () => print('clicked create account'),
              child: Text(
                _textoHyperLinkCreateAccount,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            InkWell(
              onTap: () => print('clicked Forgot password'),
              child: Text(
                _textoHyperLinkForgotPassword,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            InkWell(
              onTap: () => print('clicked privacidade'),
              child: Text(
                _textoPrivacy,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
