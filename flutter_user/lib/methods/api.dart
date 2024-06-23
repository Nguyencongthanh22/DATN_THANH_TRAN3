import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  postRequset({
    required String route,
    required Map<String, String> data,
  }) async {
    String url = 'http://10.0.2.2:8000/api' + route;
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _header());
  }

  _header() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
