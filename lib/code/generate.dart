import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData =
      "https://github.com/neon97"; // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width / 100).roundToDouble();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'QR Code Generator',
          style: TextStyle(fontSize: w * 5, fontWeight: FontWeight.normal),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(w * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: QrImage(data: qrData)),
            SizedBox(height: w * 10),
            Text(
              "New QR Link Generator",
              style: TextStyle(fontSize: w * 5),
              textAlign: TextAlign.left,
            ),
            TextField(
              controller: qrdataFeed,
              decoration: InputDecoration(
                hintText: "Input your link or data",
                hintStyle: TextStyle(fontSize: w * 5),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (qrdataFeed.text.isEmpty) {
                  setState(() {
                    qrData = "";
                  });
                } else {
                  setState(() {
                    qrData = qrdataFeed.text;
                  });
                }
              },
              child: Text(
                "Generate QR",
                style: TextStyle(
                    fontSize: w * 4,
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}
