import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Comentario.dart';
import '../Models/Livro.dart';

class LivrosREpository {
  var collectionComentario =
      FirebaseFirestore.instance.collection('Comentarios');
  var collectionLivrosLidos =
      FirebaseFirestore.instance.collection('LivrosLidos');

  validarComentario(Comentario comentario) {
    if (comentario.conteudo == "" ||
        comentario.conteudo.isEmpty ||
        comentario.conteudo.length < 10) {
      throw Exception("O comentario precisa ter ao menos 10 caracteres.");
    }
  }

  obterLivrosLidos(String username) {
    List<Object> lista = [];
    var existenciaLista = collectionLivrosLidos.doc(username).get();
    existenciaLista.then((value) => {
          if (value.exists) {lista = value["LivrosLidos"]}
        });
    return lista;
  }

  adicionaarLivroLido(Livro livro, String username) {
    List<Object> livrosLidos = obterLivrosLidos(username);
    if (livrosLidos.isNotEmpty) {
      livrosLidos.add({
        "Titulo": livro.titulo,
        "ISBN13": livro.isbn13,
        "ISBN10": livro.isbn10,
        "Autor": livro.autor
      });
      collectionLivrosLidos.doc(username).update({"LivrosLidos": livrosLidos});
    } else {
      livrosLidos.add({
        "Titulo": livro.titulo,
        "ISBN13": livro.isbn13,
        "ISBN10": livro.isbn10,
        "Autor": livro.autor
      });
      collectionLivrosLidos.doc(username).set({"LivrosLidos": livrosLidos});
    }
  }

  adicionarComentario(Comentario comentario, String username) {
    validarComentario(comentario);

    var comentou = collectionComentario.doc(username).set({
      "Comentario_id": comentario.comentarioId,
      "Conteudo": comentario.conteudo,
      "Titulo": comentario.tituloLivro,
      "ISBN13": comentario.isbn13,
      "ISBN10": comentario.isbn10
    });
    return true;
  }
}
