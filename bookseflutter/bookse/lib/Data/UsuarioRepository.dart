import 'package:bookse/Data/IRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Models/Usuario.dart';
import '../firebase_options.dart';

class UsuarioRepository {
  var collection;
  inicializacao() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    collection = FirebaseFirestore.instance.collection('Usuarios');
  }

  @override
  validarUsuario(Usuario usuario) {
    if (usuario.primeiroNome.isEmpty || usuario.primeiroNome == "") {
      throw Exception("O campo PRIMEIRO NOME é obrigatório.");
    }
    if (usuario.segundoNome.isEmpty || usuario.segundoNome == "") {
      throw Exception("O campo SEGUNDO NOME é obrigatório.");
    }
    if (usuario.email.isEmpty || usuario.email == "") {
      throw Exception("O campo EMAIL é obrigatório.");
    }
    if (!EmailValidator.validate(usuario.email)) {
      throw Exception("Email invalio.");
    }
    if (conferirEmail(usuario.email)) {
      throw Exception("Esse email já está em uso.");
    }
    if (usuario.password.isEmpty || usuario.password == "") {
      throw Exception("O campo SENHA é obrigatório.");
    }
    if (usuario.password.length < 8) {
      throw Exception("O campo SENHA precisa ter no minimo 8 caracteres.");
    }
    if (usuario.userName.isEmpty || usuario.userName == "") {
      throw Exception("O campo USERNAME é obrigatório.");
    }
    if (conferirUserName(usuario.userName)) {
      throw Exception("Nome de usuário já está em uso.");
    }
  }

  conferirEmail(String email) async {
    inicializacao();
    var retorno = await collection.where('E-mail', isEqualTo: email).get();
    return retorno.exists;
  }

  conferirUserName(String username) async {
    inicializacao();
    var retorno = await collection.where('NickName', isEqualTo: username).get();
    return retorno.exists;
  }

  cadastrar(Usuario usuario) async {
    inicializacao();

    validarUsuario(usuario);

    await collection.doc(usuario.userName).set({
      "Primeiro Nome": usuario.primeiroNome,
      "Segundo Nome": usuario.segundoNome,
      "NickName": usuario.userName,
      "E-mail": usuario.email,
      "Password": usuario.password
    }).then((error) => {throw Exception(error)});
    return conferirCadastro(usuario.userName);
  }

  conferirCadastro(String username) async {
    inicializacao();

    var retorno = await collection.where('NickName', isEqualTo: username).get();

    return retorno.docs.first.length > 0;
  }

  obter() async {
    inicializacao();

    var retorno = await collection.get();
    List<Usuario> usuarios = [];
    for (var doc in retorno.docs) {
      Usuario usuario = Usuario();
      usuario.primeiroNome = doc["Primeiro Nome"].toString();
      usuario.segundoNome = doc["Segundo Nome"].toString();
      usuario.userName = doc["NickNAme"].toString();
      usuario.email = doc["Email"].toString();
      usuario.password = doc["Password"].toString();
      usuarios.add(usuario);
    }

    return usuarios;
  }

  login(String username, String senha) async {
    inicializacao();
    var retorno = await collection.where('NickName', isEqualTo: username).get();

    for (var doc in retorno.docs) {
      if (doc["NickName"] == username && doc["Password"] == senha) {
        return true;
      } else {
        throw Exception("Senha ou Usuario incorretos.");
      }
    }
  }

  obterSenha(String username) async {
    inicializacao();
    var retorno = await collection.where('NickName', isEqualTo: username).get();
    return retorno.docs.first["Password"].toString();
  }

  atualizar() {
    inicializacao();
  }

  remover() {
    inicializacao();
  }
}
