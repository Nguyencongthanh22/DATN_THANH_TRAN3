import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user/view/category/category.dart';
import 'view/category/categoryConNam.dart';
import 'view/logInScreen.dart';
import 'view/productdetail.dart';
import 'models/user.dart';
import 'view/auth_sever.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_user/models/category.dart';

import 'view/registerScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RegisterScreen());
  }
}

// class LoadPage extends StatefulWidget {
//   const LoadPage({super.key});

//   @override
//   State<LoadPage> createState() => _LoadPageState();
// }

// class _LoadPageState extends State<LoadPage> {
//   //late AuthService service;
//   String test = '';
//   User? user;
//   Category? category;
//   // User? get Usernodel => _user;

//   Dio dio = Dio();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //service = AuthService();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       Map<String, dynamic> formData = {
//         'id_danhmuc': 2,
//         //"password": "1234567",
//       };
//       final response = await dio.get(
//           'https://e720-2001-ee0-53d8-5110-b149-8cbf-7185-daf.ngrok-free.app/api/Category',
//           data: formData,
//           options: Options(
//             headers: {
//               'Accept': 'application/json',
//             },
//           ));
//       print('Lấy data profile: ${response.data}');
//       setState(() {
//         test = response.data.toString();
//         category = Category.fromJson(jsonDecode(jsonEncode(response.data)));
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Text(category?.tendanhmuc == null
//               ? 'Đéo có'
//               : category?.tendanhmuc ?? '')),
//     );
//   }
// }
