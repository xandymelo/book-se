import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../Data/UsuarioRepository.dart';
import '../Models/Usuario.dart';
import '../components/button.dart';
import '../components/editor.dart';
import '../firebase_options.dart';
import 'package:bookse/Controller/Controllers.dart' as controller;

const _h1 = 'Crie sua conta';
const _campoNome = 'Primeiro Nome';
const _dicaCampoNome = 'João';
const _campoSegundoNome = 'Último Nome';
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

  late Color _borderColorNome = Colors.purple;
  late Color _borderColorSegundoNome = Colors.purple;
  late Color _borderColorUsername = Colors.purple;
  late Color _borderColorEmail = Colors.purple;
  late Color _borderColorConfirmaEmail = Colors.purple;
  late Color _borderColorPassword = Colors.purple;
  late Color _borderColorConfirmaPassword = Colors.purple;
  late TextEditingController _segundoNome = TextEditingController();

  final TextEditingController _userName = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _confirmaEmail = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmaPassword = TextEditingController();
  bool _visibleEmail = false;
  bool _visiblePassWord = false;
  var usuario = Usuario();

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

  executarCadastro(Usuario usuario) {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    return UsuarioRepository().cadastrar(usuario);
  }

  validarUsuarioCad(Usuario usuario) async {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await UsuarioRepository().validarUsuario(usuario);
  }

  validarCadastro(String username) {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    return UsuarioRepository().conferirCadastro(usuario.userName);
  }

  Usuario montarUsuario() {
    setState(() {
      usuario.primeiroNome = _nome.text.toString();
      usuario.segundoNome = _segundoNome.text.toString();
      usuario.userName = _userName.text.toString();
      usuario.email = _email.text.toString();
      usuario.password = _password.text.toString();
    });

    return usuario;
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
                fontSize: 36,
              ),
            ),
            Editor(
              labeltext: _campoNome,
              hinttext: _dicaCampoNome,
              controller: _nome,
              textInput: TextInputType.name,
              obscureText: false,
              colorBorder: this._borderColorNome,
              onSubmited: (String) {},
            ),
            Editor(
              labeltext: _campoSegundoNome,
              hinttext: _dicaCampoSegundoNome,
              controller: _segundoNome,
              textInput: TextInputType.name,
              obscureText: false,
              colorBorder: this._borderColorSegundoNome,
              onSubmited: (String) {},
            ),
            Editor(
              labeltext: _campoUsername,
              hinttext: _dicaCampoUsername,
              controller: _userName,
              textInput: TextInputType.name,
              obscureText: false,
              colorBorder: this._borderColorUsername,
              onSubmited: (String) {},
            ),
            Editor(
              labeltext: _campoEmail,
              hinttext: _dicaCampoEmail,
              controller: _email,
              textInput: TextInputType.name,
              obscureText: false,
              colorBorder: this._borderColorEmail,
              onSubmited: (String) {},
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
              colorBorder: this._borderColorConfirmaEmail,
              onSubmited: (String) {},
            ),
            Editor(
              labeltext: _campoPassword,
              hinttext: _dicaCampoPassword,
              controller: _password,
              textInput: TextInputType.visiblePassword,
              obscureText: true,
              colorBorder: this._borderColorPassword,
              onSubmited: (String) {},
            ),
            Visibility(
              child: Text('As senhas estão diferentes!'),
              visible: this._visiblePassWord,
            ),
            Editor(
              labeltext: _campoConfirmaPassword,
              hinttext: _dicaCampoPassword,
              controller: _confirmaPassword,
              textInput: TextInputType.text,
              obscureText: true,
              colorBorder: this._borderColorConfirmaPassword,
              onSubmited: (String) {},
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Botao(
                buttonText: _textoBotao,
                onClick: () async {
                  var retorno = true;
                  this._borderColorNome = Colors.purple;
                  this._borderColorSegundoNome = Colors.purple;
                  this._borderColorUsername = Colors.purple;
                  this._borderColorEmail = Colors.purple;
                  this._borderColorConfirmaEmail = Colors.purple;
                  this._borderColorPassword = Colors.purple;
                  this._borderColorConfirmaPassword = Colors.purple;
                  if (this._nome.text.toString() == "") {
                    this._borderColorNome = Colors.red;
                    retorno = false;
                  }
                  if (this._segundoNome.text.toString() == "") {
                    this._borderColorSegundoNome = Colors.red;
                    retorno = false;
                  }
                  if (this._userName.text.toString() == "") {
                    this._borderColorUsername = Colors.red;
                    retorno = false;
                  }
                  if (this._email.text.toString() == "") {
                    this._borderColorEmail = Colors.red;
                    retorno = false;
                  }
                  if (this._confirmaEmail.text.toString() == "") {
                    this._borderColorConfirmaEmail = Colors.red;
                    retorno = false;
                  }
                  if (this._password.text.toString() == "") {
                    this._borderColorPassword = Colors.red;
                    retorno = false;
                  }
                  if (this._confirmaPassword.text.toString() == "") {
                    this._borderColorConfirmaPassword = Colors.red;
                    retorno = false;
                  }
                  if (this._email.text.toString() !=
                      this._confirmaEmail.text.toString()) {
                    setState(() => _toggleEmail(true));
                    retorno = false;
                  } else {
                    setState(() => _toggleEmail(false));
                  }
                  if (this._password.text.toString() !=
                      this._confirmaPassword.text.toString()) {
                    setState(() => _togglePassword(true));
                    retorno = false;
                  } else {
                    setState(() => _togglePassword(false));
                  }
                  if (this._visiblePassWord == false &&
                      this._visiblePassWord == false) {
                    setState(() {
                      debugPrint('navegar para próxima tela!');
                    });
                  }
                  montarUsuario();
                  await validarUsuarioCad(usuario);
                  if (retorno == true) {
                    retorno = executarCadastro(usuario);
                    if (retorno == true) {
                      Navigator.pushNamed(context, controller.login);
                    }
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
