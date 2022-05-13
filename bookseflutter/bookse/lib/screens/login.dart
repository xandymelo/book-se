import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/editor.dart';
import 'cadastro.dart';

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
              colorBorder: Colors.purple,
            ),
            Editor(
              labeltext: _nomeCampoSenha,
              hinttext: _dicaCampoSenha,
              controller: _senha,
              textInput: TextInputType.visiblePassword,
              obscureText: true,
              colorBorder: Colors.purple,
            ),
            Botao(
              buttonText: _textoBotaoLogin,
              onClick: () {},
            ),
            InkWell(
              onTap: () => _showCadastroScreen(context),
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
              onTap: () => print('clicked Privacy'),
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

_showCadastroScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return Cadastro();
      },
    ),
  );
}
