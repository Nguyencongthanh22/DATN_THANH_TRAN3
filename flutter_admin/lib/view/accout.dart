import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/view/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Method/api.dart';
import '../models/Category.dart';
import 'addPromotion.dart';
import 'cardPromotion.dart';
import 'listStaffInfo.dart';
import 'listUserInfo.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

String? name;
late Future<String?> futurename;
late Future<List<Category2>> futureCategory2;
late Future<List<Category2>> futureCategory;
late Future<List<Category2>> futureCategory3;
Future<String?> getUsername() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  name = preferences.getString('name');
  print('___________${name}');
  return name;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("TÀI KHOẢN"),
        ]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/hinh.jpg'),
                radius: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${name}",
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
                            onPressed: () {},
                            icon: Icon(Icons.wallet_outlined)),
                        Text("Chờ xác nhận",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.work_history_outlined)),
                        Text("Đang xử lý",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.departure_board_rounded)),
                        Text("Đang giao",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_task_outlined)),
                        Text("Đã giao",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.cached_sharp)),
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
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
                child: Container(
                    padding: const EdgeInsets.all(5.0),
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                    child: Text('Thêm khuyến mãi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16))),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FutureBuilder<List<Category2>>(
                        future: futureCategory,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('No data available'));
                          } else {
                            List<Category2> categories = snapshot.data!;
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Column(
                                children: [
                                  ButtonBar(
                                    alignment: MainAxisAlignment.center,
                                    children: [
                                      for (int i = 0;
                                          i < categories.length;
                                          i++)
                                        ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return FutureBuilder<
                                                    List<Category2>>(
                                                  future: futureCategory2,
                                                  builder: (context, snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    } else if (snapshot
                                                        .hasError) {
                                                      return Center(
                                                          child: Text(
                                                              'Error: ${snapshot.error}'));
                                                    } else if (!snapshot
                                                            .hasData ||
                                                        snapshot
                                                            .data!.isEmpty) {
                                                      return Center(
                                                          child: Text(
                                                              'No data available'));
                                                    } else {
                                                      // List<Category2> categories2t = snapshot.data!;
                                                      // categories2t = categories2.where((category) => category.id_cha == categories[i].id_danhmuc).toList();
                                                      // List<Category2>
                                                      List<Category2>
                                                          categories22 =
                                                          snapshot.data!;
                                                      categories22 = categories2
                                                          .where((category) =>
                                                              category.id_cha ==
                                                              categories[i]
                                                                  .id_danhmuc)
                                                          .toList();
                                                      return AlertDialog(
                                                        title: Column(
                                                          children: [
                                                            ButtonBar(
                                                              alignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                for (int j = 0;
                                                                    j <
                                                                        categories22
                                                                            .length;
                                                                    j++)
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return FutureBuilder<
                                                                              List<Category2>>(
                                                                            future:
                                                                                futureCategory3,
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                                                return Center(child: CircularProgressIndicator());
                                                                              } else if (snapshot.hasError) {
                                                                                return Center(child: Text('Error: ${snapshot.error}'));
                                                                              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                                                                return Center(child: Text('No data available'));
                                                                              } else {
                                                                                //List<Category2>
                                                                                List<Category2> categories32 = snapshot.data!;
                                                                                categories32 = categories3.where((category) => category.id_cha == categories22[j].id_danhmuc).toList();
                                                                                //print('_____________-${categories32}');
                                                                                return AlertDialog(
                                                                                  title: Column(
                                                                                    children: [
                                                                                      ButtonBar(
                                                                                        alignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          for (int h = 0; h < categories32.length; h++)
                                                                                            if (categories32.isNotEmpty)
                                                                                              ElevatedButton(
                                                                                                child: Text(
                                                                                                  categories32.isNotEmpty
                                                                                                      ? categories32[h]?.cap == 3
                                                                                                          ? categories32[h]?.tendanhmuc ?? 'khong'
                                                                                                          : 'khong'
                                                                                                      : 'Loading...',
                                                                                                ),
                                                                                                onPressed: () {
                                                                                                  Navigator.push(
                                                                                                      context,
                                                                                                      MaterialPageRoute(
                                                                                                          builder: (context) => AddPromotion(
                                                                                                                id_danhmuc: categories32[h]?.id_danhmuc,
                                                                                                              )));
                                                                                                },
                                                                                              )
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      categories22
                                                                              .isNotEmpty
                                                                          ? categories22[j]?.cap == 2
                                                                              ? categories22[j]?.tendanhmuc ?? 'khong'
                                                                              : 'khong'
                                                                          : 'Loading...',
                                                                    ),
                                                                  )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            categories.isNotEmpty
                                                ? categories[i]?.id_cha == 0 &&
                                                        categories[i]?.cap == 1
                                                    ? categories[i]
                                                            ?.tendanhmuc ??
                                                        'khong'
                                                    : 'khong'
                                                : 'Loading...',
                                          ),
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      );
                    },
                  );
                }),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPromotion()));
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
                child: Text('Quản lý khuyến mãi',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardStaffInfo()));
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
                child: Text('Quản lý nhân viên',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardUserInfo()));
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
                child: Text('Quản lý khách hàng',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black),
                ),
              ),
              child: Text('Đăng nhập',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
