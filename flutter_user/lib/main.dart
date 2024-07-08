import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user/view/cartScreen.dart';
import 'package:flutter_user/view/category/category.dart';
import 'package:flutter_user/view/numberUpDown.dart';
import 'package:flutter_user/view/orderDetail.dart';
import 'package:flutter_user/view/productDetail.dart';
import 'view/MainScreen.dart';
import 'view/account.dart';
import 'view/category/categoryConNam.dart';
import 'view/homescreen.dart';
import 'view/logInScreen.dart';
import 'models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_user/models/category.dart';
import 'view/cardDetailOrder.dart';
import 'view/paymentScreen.dart';
import 'view/registerScreen.dart';
import 'view/thongbao.dart';
import 'view/listCardProductOrder.dart';
import 'view/orderProductDetail.dart';
import 'view/numberUpDown.dart';
import 'view/returnProduct.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData customTheme = ThemeData(
    primaryColor: Colors.red[400], // Màu chủ đạo của ứng dụng
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.black),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.red),
          ),
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.red, fontSize: 24),
      contentTextStyle: TextStyle(color: Colors.red[400], fontSize: 18),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}
