import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class API {
  late String url;
  String uri = 'https://troll-touched-basically.ngrok-free.app/api';
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
postRequset2({
    required String route,
    required Map< String,Object?> data,
  }) async {
    url = uri + route;
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _header());
  }

  _header2() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
  getUrl(
    String route,
  ) {
    return url = uri + route;
  }
}


