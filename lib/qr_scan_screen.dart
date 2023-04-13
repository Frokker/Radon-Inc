import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:safety_url/logic.dart';
import 'package:safety_url/view/widgets/body.dart';
import 'package:url_launcher/url_launcher.dart';

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

  _launchURL(String data) async {
    String url = data;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _showDialog(String data) {
    return AlertDialog(
      title: const Text('Ссылка проверена'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('This is a demo alert dialog.'),
            Text('Would you like to approve of this message?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Отмена'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Перейти'),
          onPressed: () {
            _launchURL(data);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radon Qr Code Scanner"),
        centerTitle: true,
      ),
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
              AlertDialog(
                title: Text('Вирусный сайт'),
                content: Text(
                    'https://pub.flutter-io.cn/packages/json_serializable/install'),
                actions: [
                  ElevatedButton(onPressed: () {}, child: Text('Oтмена')),
                  ElevatedButton(onPressed: () {}, child: Text('Перейти')),
                ],
              ),
              Body(),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text("Проверить"),
              //   style: ButtonStyle(
              //     foregroundColor: MaterialStateProperty.all(Colors.white),
              //     backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => scanQrCode(),
                child: const Text("Отсканировать повторно"),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.orange[400]),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
