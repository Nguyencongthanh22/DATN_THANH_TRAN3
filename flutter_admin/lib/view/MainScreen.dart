import 'package:flutter/material.dart';
import 'package:flutter_admin/view/chart.dart';

import 'accout.dart';
import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Manscreec(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Manscreec extends StatefulWidget {
  const Manscreec({super.key});

  @override
  State<Manscreec> createState() => _ManscreecState();
}

class _ManscreecState extends State<Manscreec> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    SparkBarChartExample(),
    //const NotificationsScreen(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
         onTap: (index) async {
        //   if (index == 3) {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const RegisterScreen()),
        //     );
        //     return;
        //   }
           setState(() {
             _currentIndex = index;
          });
        },
        selectedLabelStyle: TextStyle(color: Colors.lightBlue[200]),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedItemColor: Colors.lightBlue[200],
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Thống kê',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications),
          //   label: 'Thông báo',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }
}