import 'package:bookse/Models/books.dart';
import 'package:bookse/screens/BookScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

import '../components/editor.dart';

const _titulo = 'Leituras';
const _hintBusca = 'Busque por um livro';

class Reading extends StatefulWidget {
  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  final TextEditingController _busca = TextEditingController();
  late List<Book> _response = [];

  getResponse() {
    setState(() {
      _response = [
        Book(
            'teste',
            'teste',
            'tituloeste',
            'subtituloteste',
            'autor',
            'categoria',
            'http://books.google.com/books/content?id=KQZCPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
            'descricao',
            1900,
            4,
            2345,
            1234),
        Book(
            'teste',
            'teste',
            'tituloeste2',
            'subtituloteste',
            'autor',
            'categoria',
            'http://books.google.com/books/content?id=KQZCPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
            'descricao',
            1900,
            3,
            2345,
            1234),
        Book(
            'teste',
            'teste',
            'tituloeste3',
            'subtituloteste',
            'autor',
            'categoria',
            'http://books.google.com/books/content?id=KQZCPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
            'descricao',
            1900,
            2,
            2345,
            1234),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          children: <Widget>[
            Editor(
              controller: _busca,
              colorBorder: Colors.purple,
              obscureText: false,
              hinttext: _hintBusca,
              labeltext: '',
              textInput: TextInputType.text,
              icon: Icons.search,
              onSubmited: (String) {
                getResponse();
              },
            ),
            _response != null ? _buildResponse() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildResponse() {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: _response.length,
      itemBuilder: (BuildContext _context, int i) {
        return _buildRow(_response[i]);
      },
    );
  }

  Widget _buildRow(Book response) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          response.titulo,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(response.thumbmail),
        ),
        tileColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onTap: () {/*_navigateToBook(context, response);*/},
      ),
    );
  }
}

/*void _navigateToBook(BuildContext context, Book response) {
  SchedulerBinding.instance?.addPostFrameCallback((a) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return BookScreen(response);
        },
      ),
    );
  });
}*/
