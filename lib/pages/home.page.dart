import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String stringResponse;
  List listResponse;

  Future fetchData() async {
    http.Response response;
    response = await http.get(
        'https://api.thingspeak.com/channels/1232722/fields/1.json?api_key=PAQT80YWUHO3VMY6&results=10');
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    int teste = stringResponse.toString().length;
    String descobrir = stringResponse[teste - 1].toString();
    String minUltimaTemp = "";
    String horaUltimaTemp = "";
    String diaUltimaTemp = "";
    String temperatura = "";
    String mesUltimaTemp = "";
    String anoUltimaTemp = "";

    if (descobrir == "}") {
      temperatura = stringResponse[teste - 6].toString() +
          stringResponse[teste - 5].toString();
      minUltimaTemp = stringResponse[teste - 38].toString() +
          stringResponse[teste - 37].toString();
      horaUltimaTemp = stringResponse[teste - 41].toString() +
          stringResponse[teste - 40].toString();
      diaUltimaTemp = stringResponse[teste - 44].toString() +
          stringResponse[teste - 43].toString();
      mesUltimaTemp =
          stringResponse[teste - 46].toString() + stringResponse[teste - 47];
      anoUltimaTemp = stringResponse[teste - 52].toString() +
          stringResponse[teste - 51].toString() +
          stringResponse[teste - 50].toString() +
          stringResponse[teste - 49].toString();
    } else {
      print('Erro');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Broker Remoto'),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                'AR CONDICIONADO',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'Atualizado em: ${diaUltimaTemp}-${mesUltimaTemp}-${anoUltimaTemp} às ${horaUltimaTemp}:${minUltimaTemp}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'DATA: ${diaUltimaTemp}-${mesUltimaTemp}-${anoUltimaTemp}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'HORA: ${horaUltimaTemp}:${minUltimaTemp}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'TEMPERATURA: ${temperatura}°',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/grafico',
                );
              },
              child: SizedBox(
                width: 600,
                height: 320,
                child: Image.asset("assets/grafico2.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
