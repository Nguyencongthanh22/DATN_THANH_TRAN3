import 'package:flutter/material.dart';
import 'package:flutter_admin/view/MainScreen.dart';
import 'package:flutter_admin/view/loginScreen.dart';
import 'package:flutter_admin/view/EditProfile.dart';
import 'package:flutter_admin/view/registerScreen.dart';
import 'view/accout.dart';
import 'view/addPromotion.dart';
import 'view/cardAddProduct.dart';
import 'view/chart.dart';
import 'view/homeScreen.dart';
import 'view/listCardProductOrder.dart';
import 'view/productDetail.dart';
import 'view/numberUpDown.dart';
import 'view/cardProducReview.dart';
import 'view/editCardProduct.dart';
import 'view/editProduct.dart';
import 'view/listUserInfo.dart';
import 'view/listStaffInfo.dart';
import 'view/detailUserInfo.dart';
import 'view/detailStaffInfo.dart';
import 'view/promotionScreen.dart';

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
      home:Manscreec(),
    );
  }
}
