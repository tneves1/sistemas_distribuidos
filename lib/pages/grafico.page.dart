import 'package:flutter/material.dart';

class GraficoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Grafico"),
        ),
        body: Center(child: Image.asset('assets/grafico2.png'))
    );
  }
}