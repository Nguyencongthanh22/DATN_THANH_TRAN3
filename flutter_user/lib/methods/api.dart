import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class API {
  late String url;
  String uri = 'https://b272-113-161-77-223.ngrok-free.app/api';
  Dio dio = Dio();
  postRequset({
    required String route,
    required Map<String, String> data,
  }) async {
    url = uri + route;
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _header());
  }

  _header() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
  addPostFrameCallback(
      {required String email,
      required String route,
      required Map<String, dynamic> formData}) async {
    Map<String, dynamic> formData = {
      'email': email

      //"password": "1234567",
    };
    url = uri + route;
    return await dio.get(url,
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ));
  }

  getUrl(
    String route,
  ) {
    return url = uri + route;
  }
}
