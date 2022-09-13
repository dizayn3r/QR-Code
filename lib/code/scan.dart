import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult = "Not Yet Scanned";

  ScanResult? scanResult;
  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width / 100).roundToDouble();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(w * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Result",
              style: TextStyle(fontSize: w * 6, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: w * 5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: w * 4,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  scanResult = await BarcodeScanner.scan();
                  setState(() {
                    qrCodeResult = scanResult!.rawContent;
                  });
                } catch (e) {
                  print(e);
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(w * 80, w * 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(w * 2),
                ),
              ),
              child: Text(
                "Open Scanner",
                style: TextStyle(
                  fontSize: w * 4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
