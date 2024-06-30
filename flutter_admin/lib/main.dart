import 'package:flutter/material.dart';
import 'view/homeScreen.dart';
import 'view/cardAddProduct.dart';
import 'view/productDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetail(),
    );
  }
}
