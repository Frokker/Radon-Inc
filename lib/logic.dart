import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class GetResponces {
  late String url;
  GetResponces({required this.url});

  Uint8List base64Decode(String source) => base64.decode(source);

  Future<void> getVaritify() async {
    final response = await Dio().get('');
  }
}
