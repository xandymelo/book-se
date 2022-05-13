import 'package:flutter/material.dart';

const _titulo = '• Book-se •';

const _textoRecomendacao = 'Recomendação do dia';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final title = 'O livro da loucura';
  final thumbmail = 'http://books.google.com/books/content?id=KQZCPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api';
  final dataGraphic = [
    {'categoria': 'Terror', 'QuantidadeLivrosLidos': 5},
    {'categoria': 'Comédia',  'QuantidadeLivrosLidos': 20},
    {'categoria': 'Sci-fi',  'QuantidadeLivrosLidos': 36},
    {'categoria': 'Fantasia',  'QuantidadeLivrosLidos': 10},
    {'categoria': 'Drama',  'QuantidadeLivrosLidos': 10},
    {'categoria': 'Policial',  'QuantidadeLivrosLidos': 20},
  ];

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
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.purple),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        _textoRecomendacao,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Text(
                    //   this.title,
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Image.network(this.thumbmail),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
