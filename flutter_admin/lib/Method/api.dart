import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class API {
  late String url;
  String uri = 'https://9b81-113-161-65-232.ngrok-free.app/api';
  Dio dio = Dio();
  postRequset({
    required String route,
    required Map<String, Object?> data,
  }) async {
    url = uri + route;
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _header());
  }
Future<Response> postRequset2({required String route, required Map<String, dynamic> data}) async {
    String api = getUrl(route); // Assuming getUrl is a method that constructs the full URL
    return await dio.post(
      api,
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
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

