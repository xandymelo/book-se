import 'package:bookse/screens/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Models/UserBooksData.dart';
import 'login.dart';

const _titulo = '• Book-se •';

const _textoRecomendacao = 'Recomendação do dia';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final title = 'O livro da loucura';
  final thumbmail =
      'http://books.google.com/books/content?id=KQZCPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api';
  late List<UserBooksData> _chartData = getChartData();

  List<UserBooksData> getChartData() {
    final List<UserBooksData> chartData = [
      UserBooksData('terror', 20),
      UserBooksData('comédia', 5),
      UserBooksData('Policial', 3),
      UserBooksData('Sci-fi', 32),
    ];
    return chartData;
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Image.network(this.thumbmail),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  LineSeries<UserBooksData, dynamic>(
                      dataSource: _chartData,
                      xValueMapper: (UserBooksData data, _) => data.categoria,
                      yValueMapper: (dynamic data, _) => data.livrosLidos)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
