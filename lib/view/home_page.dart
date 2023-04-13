import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safety_url/view/widgets/body.dart';
import 'package:safety_url/view/widgets/floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(child: Body()),
        appBar: AppBar(
          leading: Image.asset(
            'assets/logo2.png',
            height: 100,
          ),
          title: const Text('Radon Qr Code Scanner'),
          centerTitle: true,
        ),

        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.black,
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.kayaking),
        //         label: '',
        //         backgroundColor: Colors.transparent),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.kayaking),
        //         label: '',
        //         backgroundColor: Colors.transparent),
        //   ],
        // ),
        floatingActionButton: const FloatingButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
      ),
    );
  }
}
