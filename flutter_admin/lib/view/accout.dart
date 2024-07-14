import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/view/MainScreen.dart';
import 'package:flutter_admin/view/editProduct.dart';
import 'package:flutter_admin/view/homeScreen.dart';
import 'package:flutter_admin/view/loginScreen.dart';
import 'package:flutter_admin/view/EditProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Method/api.dart';
import '../models/Category.dart';
import 'addPromotion.dart';
import 'cardPromotion.dart';
import 'listCardProductOrder.dart';
import 'listStaffInfo.dart';
import 'listUserInfo.dart';
import 'profile.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

String? name;
late Future<String?> futurename;
late Future<String?> futureEmail;
late Future<int?> futureQuyen;
late Future<List<Category2>> futureCategory2;
late Future<List<Category2>> futureCategory;
late Future<List<Category2>> futureCategory3;
Future<String?> getUsername() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  name = preferences.getString('name');
  print('___________${name}');
  return name;
}

int? quyen;
Future<int?> getUserQuyen() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  quyen = preferences.getInt('quyen');
  print('___________${quyen}');
  // return quyen;
}

class _AccountState extends State<Account> {
  Dio dio = Dio();
  List<int> categoryIds = [1, 2, 3, 4];
  List<int> categoryid_cha = [0];
  List<int> categoryIdscha2 = [
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32
  ];
  List<int> categorycap = [1];
  List<int> categorycap2 = [2];
  List<int> categorycap3 = [3];
  List<Category2> categories2 = []; // Danh sách các id danh mục
  List<Category2> categories3 = [];
  void initState() {
    super.initState();
    futureCategory = fetchData();
    futureCategory2 = fetchData2();
    futureCategory3 = fetchData3();
    futurename = getUsername();
    // futureEmail = getUserEmail();
    futureQuyen = getUserQuyen();
  }

  String? email;
  void getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email');
    print('Email: $email');
  }

  Future<List<Category2>> fetchData() async {
    List<Category2> categories = [];

    try {
      // Gửi yêu cầu GET cho từng id danh mục trong danh sách
      for (int id in categoryIds) {
        for (int id_cha in categoryid_cha) {
          for (int cap in categorycap) {
            String api = API().getUrl('/Category2');
            final response = await dio.get(
              api,
              queryParameters: {'id_danhmuc': id, 'id_cha': id_cha, 'cap': cap},
              options: Options(
                headers: {
                  'Accept': 'application/json',
                },
              ),
            );
            print('________________${response.data}');
            // Check if response data is valid
            if (response.statusCode == 200) {
              Category2 category = Category2.fromJson(response.data);
              if (category.id_danhmuc != null) {
                categories.add(category);
              } else {
                continue;
              }
            } else {
              print('Error fetching data: ${response.statusCode}');
              continue;
            }
          }
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    return categories; // Return list of Category objects
  }

  Future<List<Category2>> fetchData2() async {
    try {
      for (int id_cha in categoryIds) {
        for (int cap in categorycap2) {
          String api = API().getUrl('/Showid');
          final response = await dio.get(
            api,
            queryParameters: {'id_cha': id_cha, 'cap': cap},
            options: Options(
              headers: {
                'Accept': 'application/json',
              },
            ),
          );

          // Check if response data is valid
          if (response.statusCode == 200) {
            // Handle response.data as a list of objects
            List<dynamic> dataList = response.data as List<dynamic>;
            for (var data in dataList) {
              // Ensure data is of type Map<String, dynamic>
              if (data is Map<String, dynamic>) {
                Category2 category2 = Category2.fromJson(data);
                if (category2.id_danhmuc != null) {
                  categories2.add(category2);
                }
              }
            }
          } else {
            print('Error fetching data: ${response.statusCode}');
          }
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    return categories2; // Return list of Category2 objects
  }

  Future<List<Category2>> fetchData3() async {
    try {
      for (int id_cha in categoryIdscha2) {
        for (int cap in categorycap3) {
          String api = API().getUrl('/Showid2');
          final response = await dio.get(
            api,
            queryParameters: {'id_cha': id_cha, 'cap': cap},
            options: Options(
              headers: {
                'Accept': 'application/json',
              },
            ),
          );

          // Check if response data is valid
          if (response.statusCode == 200) {
            // Handle response.data as a list of objects
            List<dynamic> dataList = response.data as List<dynamic>;
            for (var data in dataList) {
              // Ensure data is of type Map<String, dynamic>
              if (data is Map<String, dynamic>) {
                Category2 category32 = Category2.fromJson(data);
                if (category32.id_danhmuc != null) {
                  categories3.add(category32);
                }
              }
            }
          } else {
            print('Error fetching data: ${response.statusCode}');
          }
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    return categories3; // Return list of Category2 objects
  }

  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Manscreec()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("TÀI KHOẢN"),
          ]),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/imageicon.jpg'),
                radius: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${name != null ? name : 'Tên tài khoản'}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Profile())));
                      },
                      child: Text(
                        "chỉnh sửa tài khoản",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text("Quản lý đơn hàng",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          // SizedBox(
          //   height: 10,
          // ),
         Container(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: ()  {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListCardProductOrder(initialIndex: 0,email: email,)));},
                            icon: Icon(Icons.wallet_outlined)),
                        Text("Chờ xác nhận",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListCardProductOrder(initialIndex: 1,email: email,)));},
                            icon: Icon(Icons.work_history_outlined)),
                        Text("Đang xử lý",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: ()  {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListCardProductOrder(initialIndex: 2,email: email,)));},
                            icon: Icon(Icons.departure_board_rounded)),
                        Text("Đang giao",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListCardProductOrder(initialIndex: 3,email: email,)));},
                            icon: Icon(Icons.add_task_outlined)),
                        Text("Đã giao",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: ()  {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListCardProductOrder(initialIndex: 4,email: email,)));}, icon: Icon(Icons.cached_sharp)),
                        Text("Trả hàng",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 0.7,
                  ),
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 0.7,
                  ),
                ),
              )),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileOut(
                                emails: name,
                              )));
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                  child: Text('Tài khoản',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          ),
        ]));
  }
}
