import 'package:flutter/material.dart';
import 'package:flutter_admin/view/accout.dart';
import 'package:flutter_admin/view/chart.dart';
import 'package:flutter_admin/view/loginScreen.dart';
 // Đã sửa từ accout.dart thành account.dart
import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Sửa từ super.key thành Key? key

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
  const Manscreec({Key? key}) : super(key: key); // Sửa từ super.key thành Key? key

  @override
  State<Manscreec> createState() => _ManscreecState();
}

class _ManscreecState extends State<Manscreec>
    with AutomaticKeepAliveClientMixin<Manscreec> {
  int _currentIndex = 0;

  @override
  bool get wantKeepAlive => true; // Giữ lại trạng thái của Manscreec khi chuyển tab
final List<Widget> _pages = [
    const HomeScreen(),
    SparkBarChartExample(),
    //const NotificationsScreen(),
    const Account(),
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context); // Đảm bảo gọi hàm build của mixin

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
                
           
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }
}
