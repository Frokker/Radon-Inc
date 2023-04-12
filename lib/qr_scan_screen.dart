import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({Key? key}) : super(key: key);

  @override
  _QrScanScreenState createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  String data = "";

  void scanQrCode() {
    FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.QR)
        .then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    scanQrCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Qr Code Scanner"), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  Visibility(
              //   visible: data != "",
              //   child: Text(data != "-1" ? data : "Qr Kode Bulunamad"),
              // ),
              Row(
                children: [
                  Center(
                    child: Text(data != '-1' ? data : 'nothing'),
                  ),

                  // data[0] + data[1] + data[2] + data[3] == "http" ? ElevatedButton(onPressed: (){}, child: Text('Перейти')) : Text(''),
                ],
              ),

              ElevatedButton(
                onPressed: () => scanQrCode(),
                child: const Text("Отсканировать повторно"),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
