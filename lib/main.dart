import 'package:flutter/material.dart';
import 'package:safety_url/qr_scan_screen.dart';
import 'package:safety_url/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.orange),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.amber),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.amber)),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.orange),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Qr Code Scanner',
      routes: {
        '/': (context) => HomePage(),
        'qrPage': (context) => QrScanScreen(),
      },
      initialRoute: '/',
    );
  }
}
