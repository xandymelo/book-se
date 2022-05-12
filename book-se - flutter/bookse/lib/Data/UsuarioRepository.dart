import 'package:bookse/Data/IRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Models/Usuario.dart';
import '../firebase_options.dart';

class UsuarioRepository {
  var collection = FirebaseFirestore.instance.collection('Usuarios');
  var retorno;
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
    conferirEmail(usuario.email);

    if (usuario.password.isEmpty || usuario.password == "") {
      throw Exception("O campo SENHA é obrigatório.");
    }
    if (usuario.password.length < 8) {
      throw Exception("O campo SENHA precisa ter no minimo 8 caracteres.");
    }
    if (usuario.userName.isEmpty || usuario.userName == "") {
      throw Exception("O campo USERNAME é obrigatório.");
    }
    conferirUserName(usuario.userName);
  }

  conferirEmail(String email) async {
    var retorno = await collection.where('E-mail', isEqualTo: email).get();
    if (retorno.size > 0) {
      throw Exception("Este email já está em uso.");
    }
  }

  conferirUserName(String username) async {
    var retorno = await collection.doc(username).get();
    if (retorno.exists) {
      throw Exception("Nome de usuário já está em uso.");
    }
  }

  cadastrar(Usuario usuario) async {
    validarUsuario(usuario);

    await collection.doc(usuario.userName).set({
      "Primeiro Nome": usuario.primeiroNome,
      "Segundo Nome": usuario.segundoNome,
      "NickName": usuario.userName,
      "E-mail": usuario.email,
      "Password": usuario.password
    });
    //return conferirCadastro(usuario.userName);
  }

  conferirCadastro(String username) async {
    var retorno = await collection.where('NickName', isEqualTo: username).get();

    return retorno;
  }

  obter() async {
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

  login(String email, String senha) async {
    var retorno = await collection.where("E-mail", isEqualTo: email).get();
    print(retorno.docs);
    for (var doc in retorno.docs) {
      print("doc");
      if (doc["Email"].toString() == email &&
          doc["Password"].toString() == senha) {
        print(true);
        return true;
      }
    }
    throw Exception("Senha ou Email incorretos.");
  }

  obterSenha(String username) async {
    var retorno = await collection.where('NickName', isEqualTo: username).get();
    return retorno.docs.first["Password"].toString();
  }

  atualizar() {}

  remover() {}
}
