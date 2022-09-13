import 'package:flutter/material.dart';
import 'package:qr_code/code/scan.dart';

import 'code/generate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width / 100).roundToDouble();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Homepage'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(w * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Icon(
                Icons.qr_code_2_rounded,
                size: w * 50,
              ),
            ),
            button(
              "Scan QR CODE",
              ScanPage(),
            ),
            SizedBox(height: w * 4),
            button(
              "Generate QR CODE",
              GeneratePage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String text, Widget widget) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(text),
    );
  }
}
