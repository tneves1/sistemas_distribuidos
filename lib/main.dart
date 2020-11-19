import 'package:flutter/material.dart';
import 'pages/tela1.page.dart';
import 'pages/grafico.page.dart';
import 'pages/home.page.dart';

void main() {
  runApp(MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => TelaInicial(),
        '/dados': (context) => HomePage(),
        '/grafico': (context) => GraficoPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}