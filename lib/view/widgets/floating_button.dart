import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: FloatingActionButton(
        hoverColor: Colors.blue,
        elevation: 4.0,
        onPressed: () => Navigator.pushNamed(context, 'qrPage'),
        child: Container(
          height: 76,
          width: 76,
          child: SvgPicture.asset(
            'assets/circus_qr_icon.svg',
          ),
        ),
      ),
    );
  }
}
