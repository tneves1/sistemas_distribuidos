import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white70,
        child: ListView(
          children: [
            SizedBox(
              width: 120,
              height: 130,
              child: Image.asset("assets/logo-una.png"),
            ),
            SizedBox(
              height: 160,
            ),
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Broker Remoto",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    child: SizedBox(
                      child: Image.asset("assets/thingSpeak.png"),
                      height: 50,
                      width: 100,
                    ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/dados',
                );
              },
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
