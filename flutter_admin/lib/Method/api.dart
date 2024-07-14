import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class API {
  late String url;
  String uri = 'https://buffalo-quality-ferret.ngrok-free.app/api';
  Dio dio = Dio();
  postRequset({
    required String route,
    required Map<String, Object?> data,
  }) async {
    url = uri + route;
    try{
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _header());
    }
    catch(e){print('Error in postRequest: $e');
      rethrow;}
  }
Future<Response<dynamic>> postRequest2({
  required String route,
  required Map<String, dynamic> data,
}) async {
  String api = getUrl(route);
  try {
    return await dio.post(
      api,
      data: data,
      options: Options(
        headers: _header(),
      ),
    );
  } on DioError catch (e) {
    if (e.response != null) {
      // The request was made and the server responded with a status code
      print('Server responded with status ${e.response!.statusCode}');
      print('Response data: ${e.response!.data}');
      throw e; // Rethrow the DioError to handle it where the method is called
    } else {
      // Something else went wrong, like a network error
      print('Error sending request: ${e.message}');
      throw e; // Rethrow the DioError to handle it where the method is called
    }
  }
}

  _header() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
 

  getUrl(
    String route,
  ) {
    return url = uri + route;
  }
}

