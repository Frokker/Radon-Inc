// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';

// class UrlInput {
//   late String url;
//   UrlInput(this.url);
// }


// class GetResponse {
//   late String url;

//   GetResponse({required this.url});

//   // void getProducts() async {
//   //   String htoken = Utils.prefs.getString("token");
//   //   try {
//   //     Dio dio = Dio();
//   //     Response response = await dio.post("http://URL",
//   //         data: {},
//   //         options: Options(
//   //           headers: {"appusertoken": "$htoken"},
//   //         ));
//   //     print("data coming");
//   //     print(response);
//   //   } on DioError catch (e) {
//   //     print(e.response.data);
//   //     print(e.response.headers);
//   //     print(e.response.request);
//   //   }
//   // }

//   final client = HttpClient();
//   void getPosts (String data) async{
//     final url = Uri.parse(data);
//     final request = await client.getUrl(url);
//     request.headers({});
//   }

//   Uint8List base64Decode(String source) => base64.decode(source);

//   String encoded =
//       base64Url.encode(utf8.encode(credentials)); // dXNlcm5hbWU6cGFzc3dvcmQ=
//   String decoded = utf8.decode(base64Url.decode(encoded)); 

//   Future<void> getVaritify() async {
    
//     final response = await Dio().get(
//         'https://www.virustotal.com/api/v3/$url/{url_id}',
//         queryParameters: {
          
//           "accept": "application/json",
//           "x-apikey":
//               "436f3c819f4456f918c14ec909e7c7808b9b94db14ace82607b624c279f037da",
//         }).then((value) => null).catchError((error){ print(error  )}) ;
    
//   }
// }
