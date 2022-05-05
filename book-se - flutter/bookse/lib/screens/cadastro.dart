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

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _nome = TextEditingController();

  final TextEditingController _segundoNome = TextEditingController();

  final TextEditingController _userName = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _confirmaEmail = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmaPassword = TextEditingController();
  bool _visibleEmail = false;
  bool _visiblePassWord = false;

  void _toggleEmail(bool) {
    setState(() {
      this._visibleEmail = bool;
    });
  }
  void _togglePassword(bool) {
    setState(() {
      this._visiblePassWord = bool;
    });
  }

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
             Text(
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
            Visibility(
              child: Text('Os e-mails estão diferentes!'),
              visible: this._visibleEmail,
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
            Visibility(
              child: Text('As senhas estão diferentes!'),
              visible: this._visiblePassWord,
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
              child: Botao( buttonText: _textoBotao, onClick: () {
                  if ( this._email.text.toString() != this._confirmaEmail.text.toString() ) {
                      debugPrint(this._email.text);
                      debugPrint(this._confirmaEmail.text);
                      setState(() => _toggleEmail(true));
                    } else {
                    setState(() => _toggleEmail(false));
                  }
                  if ( this._password.text.toString() != this._confirmaPassword.text.toString() ) {
                    setState(() => _togglePassword(true));
                  } else {
                    setState(() => _togglePassword(false));
                  }
                  if ( this._visiblePassWord == false && this._visiblePassWord == false ) {
                    setState(() {
                      debugPrint('navegar para próxima tela!');
                    });
                  }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
