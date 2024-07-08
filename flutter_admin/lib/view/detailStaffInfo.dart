import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Method/api.dart';
import '../models/user.dart';
import 'listStaffInfo.dart';

class DetailStaffInfo extends StatefulWidget {
  const DetailStaffInfo({super.key, this.email});
  final String? email;
  @override
  State<DetailStaffInfo> createState() => _DetailStaffInfoState();
}

class _DetailStaffInfoState extends State<DetailStaffInfo> {
  bool isChecked = false;
  void initState() {
    super.initState();
    dataAdmin = getUser();
  }

  List<User> user = [];
  Dio dio = Dio();
  late Future<User> dataAdmin;

  Future<User> getUser() async {
    String api = API().getUrl('/getProfileAdminEmail');
    final response = await dio.get(api,
        queryParameters: {'email': widget.email},
        options: Options(
          headers: {'Accept': 'application/json'},
        ));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return User.fromJson(data);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<void> refreshUser() async {
    setState(() {
      dataAdmin = getUser();
    });
  }

  int trangthai1 = 1;
  Future<void> updateTrangthai() async {
    String api = API().getUrl('/updateProfileAdmin');
    try {
      final response = await Dio().put(
        api,
        data: {
          'email': widget.email,
          'trangthai': trangthai1,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        refreshUser();
      } else {
        print('Failed to update profile: ${response.data}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  int trangthai2 = 0;
  Future<void> updateTrangthai2() async {
    String api = API().getUrl('/updateProfileAdmin');
    try {
      final response = await Dio().put(
        api,
        data: {
          'email': widget.email,
          'trangthai': trangthai2,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        refreshUser();
      } else {
        print('Failed to update profile: ${response.data}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CardStaffInfo())));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
          ),
          title: const Text('Thông tin nhân viên'),
        ),
        body: FutureBuilder<User>(
            future: dataAdmin,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return Text('No products available');
              } else {
                User user2 = snapshot.data!;
                return SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.red),
                                  ),
                                ),
                                child: Text(
                                  'Email: ${user2.email ?? ''}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.red),
                                  ),
                                ),
                                child: Text(
                                  'Tên: ${user2.name ?? ''}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.red),
                                  ),
                                ),
                                child: Text(
                                  'So dien thoai: ${user2.sodienthoai ?? ""}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.red),
                                  ),
                                ),
                                child: Text(
                                  'Đia chỉ: ${user2.diachi ?? ""}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.red),
                                  ),
                                ),
                                child: Text(
                                  'Gioi tinh: ${user2.gioitinh ?? ""}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.red),
                                  ),
                                ),
                                child: Text(
                                  'Ngay sinh: ${user2.ngaysinh}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.red),
                                  ),
                                ),
                                child: Text(
                                  'Ngày vào làm: ',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              user2.trangthai == 1
                                  ? Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 4,
                                            minimumSize: Size(0, 70),
                                            backgroundColor: Colors.black87,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10), // Loại bỏ góc bo tròn
                                            ),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    title: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .warning_rounded,
                                                              color:
                                                                  Colors.yellow,
                                                              size: 35,
                                                            ),
                                                            Text(
                                                              'Bạn chắc chắn với thay đổi này?'
                                                                  .toString()
                                                                  .substring(
                                                                      0, 26),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  updateTrangthai2();
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  'Có',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                )),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'Không',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black)))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            'Xóa tài khoản',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19),
                                          )),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 4,
                                            minimumSize: Size(0, 70),
                                            backgroundColor: Colors.black87,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10), // Loại bỏ góc bo tròn
                                            ),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    title: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .warning_rounded,
                                                              color:
                                                                  Colors.yellow,
                                                            ),
                                                            Text(
                                                              'Bạn chắc chắn với thay đổi này?'
                                                                  .toString()
                                                                  .substring(
                                                                      0, 26),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  updateTrangthai();
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  'Có',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                )),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  'Không',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            'Khôi phục tài khoản',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19),
                                          )),
                                    )
                            ])));
              }
            }));
  }
}
