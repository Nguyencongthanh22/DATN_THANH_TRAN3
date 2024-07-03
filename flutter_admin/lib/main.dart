import 'package:flutter/material.dart';
import 'view/addProductVariation.dart';
import 'view/homeScreen.dart';
import 'view/cardAddProduct.dart';
import 'view/addProduct.dart';
import 'view/productDetail.dart';
import 'view/numberUpDown.dart';
import 'view/cardProducReview.dart';
import 'view/editCardProduct.dart';
import 'view/editProduct.dart';
import 'view/cardProduct.dart';

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
      home: ProductDetail(),
    );
  }
}
