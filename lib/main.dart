import 'package:flutter/material.dart';
import 'package:safety_url/body.dart';
import 'package:safety_url/qr_scan_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr Code Scanner',
      routes: {
        '/': (context) => HomeScreen(),
        'qrPage': (context) => QrScanScreen(),
      },
      initialRoute: '/',
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        leading: Image.asset(
          'assets/logo.png',
          height: 100,
        ),
        title: const Text('Qr Code Scanner'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: '',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.kayaking),
              label: '',
              backgroundColor: Colors.transparent),
        ],
      ),
      floatingActionButton: Container(
        height: 72,
        width: 72,
        child: FloatingActionButton(
          hoverColor: Colors.blue,
          elevation: 4.0,
          onPressed: () => Navigator.pushNamed(context, 'qrPage'),
          child: SvgPicture.asset(
            'assets/qr_icon.svg',
            fit: BoxFit.fill,
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      // body: Body(),
    );
  }
}
