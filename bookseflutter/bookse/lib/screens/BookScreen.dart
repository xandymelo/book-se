import 'package:bookse/Models/books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';

class BookScreen extends StatelessWidget {
  @override
  final Book response;

  BookScreen(this.response);

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          centerTitle: true,
          title: Text(
            response.titulo,
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network(response.thumbmail),
                  ),
                  Container(
                    height: 200,
                    width: 220,
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Text(response.subtitulo),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Avaliação: ${response.media_nota}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Botao(
                      buttonText: 'Quero Ler',
                      onClick: () {},
                      icon: Icons.class_rounded,
                    ),
                    Spacer(),
                    Botao(
                      buttonText: 'Já li',
                      onClick: () {},
                      icon: Icons.chrome_reader_mode
                    ),
                  ],
                ),
              ),
              Text('Anotações'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  // width: double.infinity,
                  // height: double.infinity,
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
