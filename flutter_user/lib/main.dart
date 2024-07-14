
import 'package:flutter/material.dart';
import 'package:flutter_user/view/MainScreen.dart';
import 'package:flutter_user/view/logInScreen.dart';
import 'package:flutter_user/view/profile.dart';
import 'view/account.dart';
import 'view/HomeScreen.dart';
import 'view/category/category.dart';
import 'view/listCardProductOrder.dart';
import 'view/productDetail.dart';
import 'view/productreviews.dart';
import 'view/thongbao.dart';

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
      
       //home: Manscreec(),
      //  initialRoute: '/',
      // routes: {
      //   '/': (context) => const Homescreenn(),
      //  // '/cart': (context) => const Catelory2(),
      //   '/Notification': (context) => const NotificationsScreen(),
      //   '/profile': (context) => const Account(),
      // },
      debugShowCheckedModeBanner: false,
       //initialRoute: '/',
      // routes: {
      //   '/': (context) => const Manscreec(),
      //   '/carte': (context) => const Catelory2(),
      //   '/NotificationsScreen': (context) => const NotificationsScreen(),
      //   '/Account': (context) => const Account(),
      // },
        home: LogInScreen(),
    );
  }
}
