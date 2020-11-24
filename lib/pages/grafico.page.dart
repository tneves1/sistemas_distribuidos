import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GraficoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Grafico"),
      ),
      body: Container(
        child: WebView(
          initialUrl: Uri.dataFromString(
                  '<html><body><iframe width="520" height="260" style="border: 1px solid #cccccc;" src="https://thingspeak.com/channels/1232722/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=spline"></iframe></body></html>',
                  mimeType: 'text/html')
              .toString(),
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
