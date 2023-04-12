import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class GetResponces {
  late String url;
  
  GetResponces({required this.url});
  static Future<String> getResponces(String url) async {
    return '';
  }

  Uint8List base64Decode(String source) => base64.decode(source);

  Future<void> getVaritify() async {
    final response = await Dio().get(
        'https://www.virustotal.com/api/v3/$url/{url_id}',
        queryParameters: {
          "accept": "application/json",
          "x-apikey":
              "436f3c819f4456f918c14ec909e7c7808b9b94db14ace82607b624c279f037da",
        });
  }
}
