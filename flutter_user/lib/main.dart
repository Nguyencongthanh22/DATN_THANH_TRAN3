import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user/view/cartScreen.dart';
import 'package:flutter_user/view/category/category.dart';
import 'package:flutter_user/view/numberUpDown.dart';
import 'view/MainScreen.dart';
import 'view/account.dart';
import 'view/category/categoryConNam.dart';
import 'view/homescreen.dart';
import 'view/logInScreen.dart';
import 'models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_user/models/category.dart';
import 'view/cardDetailOrder.dart';
import 'view/registerScreen.dart';
import 'view/thongbao.dart';

import 'view/numberUpDown.dart';

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
      home: 
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const Homescreen(),
      //   '/cart': (context) => const Catelory2(),
      //   '/Notification': (context) => const NotificationsScreen(),
      //   '/profile': (context) => const Account(),
      // },
    );
  }
}
