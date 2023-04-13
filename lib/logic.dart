// // import 'package:json_annotation/json_annotation.dart';

// // part 'logic.g.dart';

// // @JsonSerializable()
// // class UrlData {
// //   @JsonKey(name: 'malicious')
// //   final int malicious;
// //   @JsonKey(name: 'suspicious')
// //   final int suspicious;
// //   UrlData({required this.malicious, required this.suspicious});

// //   factory UrlData.fromJson(Map<String, dynamic> json) {

// //     retutrn _$UrlDataFromJson(json);
// // return UrlData(
// //   malicious:
// //       json['data']['attributes']['last_analysis_stats']['malicious'] as int,
// //   suspicious: json['data']['attributes']['last_analysis_stats']
// //       ['suspicious'] as int,
// // );
// //   }

// // }
// // import 'dart:math';

// // int analysUrl() {
// //   var rng = Random();
// //   return rng.nextInt(3);
// // }
// // import 'package:python_extension/python_extension.dart';

// // void main() {
// //   PythonBridge python = PythonBridge();
// //   python.start();

// //   python.exec('import scripts');
// //   dynamic result = python.eval('scripts.code()');
// //   print(result);
// //   python.stop();
// // }


// import 'package:dartpy/dartpy.dart';

// void main() async {
//   // Создаем экземпляр PyInterpreter
//   var interpreter = await PyInterpreter.create();

//   // Загружаем код питон скрипта
//   await interpreter.loadScript('example.py');

//   // Вызываем функцию hello() на питоне
//   var result = await interpreter.run("hello()");

//   // Отображаем результат
//   print(result); // "Hello from Python!"

//   // Отключаем интерпретатор PyDart
//   await interpreter.dispose();
// }
