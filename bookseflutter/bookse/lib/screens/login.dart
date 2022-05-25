import 'package:bookse/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bookse/Controller/Controllers.dart' as controller;
import '../Data/UsuarioRepository.dart';
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
var _mensagemErro = 'O e-mail ou a senha estão incorretos';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _senha = TextEditingController();

  late bool _erro = false;

  executarLogin() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    return UsuarioRepository().login(_email.text, _senha.text);
  }

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
            Visibility(
              child: Text(
                _mensagemErro,
                style: TextStyle(color: Colors.red),
              ),
              visible: _erro,
            ),
            Editor(
              labeltext: _nomeCampoEmail,
              hinttext: _dicaCampoEmail,
              controller: _email,
              textInput: TextInputType.emailAddress,
              obscureText: false,
              colorBorder: Colors.purple,
              onSubmited: (String) {}, onChanged: (String ) {  },
            ),
            Editor(
              labeltext: _nomeCampoSenha,
              hinttext: _dicaCampoSenha,
              controller: _senha,
              textInput: TextInputType.visiblePassword,
              obscureText: true,
              colorBorder: Colors.purple,
              onSubmited: (String) {}, onChanged: (String ) {  },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Botao(
                buttonText: _textoBotaoLogin,
                onClick: () {
                  executarLogin().then((a) {
                    debugPrint('teste');
                    if (_erro == true) {
                      setState(() {
                        _erro = false;
                      });
                    }
                    if (a == true) {
                      Navigator.pushNamed(context, controller.navbar);
                    }
                  }).catchError((erro) {
                    setState(() {
                      _erro = true;
                    });
                  });
                },
                icon: Icons.login,
              ),
            ),
            InkWell(
              onTap: () => {Navigator.pushNamed(context, controller.cadastro)},
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
