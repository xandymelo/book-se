import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bookse/Controller/Controllers.dart' as controller;
import '../components/button.dart';
import '../components/editor.dart';

const _subtituloLivrosLidos = 'Você já leu algum livro antes ?';
const _subtituloCategoria = 'Você tem alguma preferência para a categoria dos livros ?';
const _campoLivroLido = 'Nome do livro';
const _dicaCampoLivroLido = 'Harry Potter';
const _segundaDicaCampoLivroLido = 'Senhor dos Anéis';
const _terceiraDicaCampoLivroLido = 'Fundação';
const _campoCategoria = 'Categoria';
const _dicaCampoCategoria = 'Terror';
const _segundaDicaCampoCategoria = 'Policial';
const _textoBotao = 'Pronto!';

class ContinuacaoCadastro extends StatelessWidget {
  final TextEditingController _livroLido = TextEditingController();
  final TextEditingController _segundoLivroLido = TextEditingController();
  final TextEditingController _terceiroLivroLido = TextEditingController();
  final TextEditingController _categoriaEscolhida = TextEditingController();
  final TextEditingController _segundaCategoriaEscolhida = TextEditingController();
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
            Center(
                child: Text(
              _subtituloLivrosLidos,
              style: TextStyle(
                fontSize: 22,
              ),
            )
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Editor(
                labeltext: _campoLivroLido,
                hinttext: _dicaCampoLivroLido,
                controller: _livroLido,
                textInput: TextInputType.name,
                obscureText: false,
                colorBorder: Colors.purple,
                onSubmited: (String) {},
                onChanged: (String) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Editor(
                labeltext: _campoLivroLido,
                hinttext: _segundaDicaCampoLivroLido,
                controller: _segundoLivroLido,
                textInput: TextInputType.name,
                obscureText: false,
                colorBorder: Colors.purple,
                onSubmited: (String) {},
                onChanged: (String) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Editor(
                labeltext: _campoLivroLido,
                hinttext: _terceiraDicaCampoLivroLido,
                controller: _terceiroLivroLido,
                textInput: TextInputType.name,
                obscureText: false,
                colorBorder: Colors.purple,
                onSubmited: (String) {},
                onChanged: (String) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Center(
                  child: Text(
                    _subtituloCategoria,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Editor(
                labeltext: _campoCategoria,
                hinttext: _dicaCampoCategoria,
                controller: _categoriaEscolhida,
                textInput: TextInputType.name,
                obscureText: false,
                colorBorder: Colors.purple,
                onSubmited: (String) {},
                onChanged: (String) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Editor(
                labeltext: _campoCategoria,
                hinttext: _segundaDicaCampoCategoria,
                controller: _categoriaEscolhida,
                textInput: TextInputType.name,
                obscureText: false,
                colorBorder: Colors.purple,
                onSubmited: (String) {},
                onChanged: (String) {},
              ),
            ),
            Botao(onClick: () {
              Navigator.pushNamed(context, controller.login);
            }, buttonText: _textoBotao, icon: Icons.fireplace_sharp,),
          ],
        ),
      ),
    );
  }
}
