// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class AuthService {
//   final String baseUrl = 'https://b3e6-42-115-92-35.ngrok-free.app/api';
//   final storage = FlutterSecureStorage();

//   Future<void> register(String name, String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/register'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'name': name, 'email': email, 'password': password}),
//     );

//     if (response.statusCode == 200) {
//       print('User registered successfully');
//     } else {
//       print('Failed to register');
//     }
//   }

//   Future<void> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       await storage.write(key: 'token', value: data['token']);
//       print('User logged in successfully');
//     } else {
//       print('Failed to login');
//     }
//   }

//   Future<void> logout() async {
//     final token = await storage.read(key: 'token');
//     final response = await http.post(
//       Uri.parse('$baseUrl/logout'),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//     );

//     if (response.statusCode == 200) {
//       await storage.delete(key: 'token');
//       print('User logged out successfully');
//     } else {
//       print('Failed to logout');
//     }
//   }
// }
