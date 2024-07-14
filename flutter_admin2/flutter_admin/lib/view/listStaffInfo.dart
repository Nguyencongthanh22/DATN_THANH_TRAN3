import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/Method/api.dart';
import 'package:flutter_admin/models/user.dart';

import 'package:flutter_admin/view/detailStaffInfo.dart';

class CardStaffInfo extends StatefulWidget {
  const CardStaffInfo({super.key});

  @override
  State<CardStaffInfo> createState() => _CardStaffInfoState();
}

class _CardStaffInfoState extends State<CardStaffInfo> {
  late Future<List<User>> dataAdmin;
  void initState() {
    super.initState();
    dataAdmin = listuser();
  }

  late List<User?> user = [];
  Dio dio = Dio();
  Future<List<User>> listuser() async {
    String api = API().getUrl('/getProfileAdminStatus');
    final respone = await dio.get(api,
        //queryParameters: {'trangthai': 1},
        options: Options(
          headers: {'Accept': 'application/json'},
        ));
    if (respone.statusCode == 200) {
      List<dynamic> data = respone.data;
      print('_______________${data}');
      List<User> fechdata = data.map((json) => User.fromJson(json)).toList();
      user.addAll(fechdata);
    }
    else {
        print('Error fetching data: ${respone.statusCode}');
      }
    return user.cast<User>();
  }

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
          ),
          title: Text('Danh sách nhân viên'),
        ),
        body: FutureBuilder<List<User>>(
            future: dataAdmin,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No products available');
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailStaffInfo(
                                  email: snapshot.data![index].email,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                snapshot.data![index].trangthai == 1
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Tài khoản: ${snapshot.data![index].email.toString().length < 15 ? snapshot.data![index].email.toString() : snapshot.data![index].email.toString().substring(0, 15)}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'Tên: ${snapshot.data![index].name.toString().length < 15 ? snapshot.data![index].name.toString() : snapshot.data![index].email.toString().substring(0, 22)}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'Trạng thái: ${snapshot.data![index].trangthai == 1 ? 'Làm việc' : ''}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                              onPressed: () {
                                              },
                                              icon: Icon(
                                                Icons.online_prediction,
                                                size: 35,
                                                color: Colors.green,
                                              )),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Tài khoản: ',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${snapshot.data![index].email.toString().length < 15 ? snapshot.data![index].email.toString() : snapshot.data![index].email.toString().substring(0, 15)}',
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Text('Tên: ',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      )),
                                                  Text(
                                                    '${snapshot.data![index].name.toString().length < 22 ? snapshot.data![index].name.toString() : snapshot.data![index].email.toString().substring(0, 22)}',
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Trạng thái: ',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${snapshot.data![index].trangthai == 0 ? 'Nghĩ việc' : ''}',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.work_off_rounded,
                                                size: 35,
                                                color: Colors.red,
                                              )),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            }));
  }
}
