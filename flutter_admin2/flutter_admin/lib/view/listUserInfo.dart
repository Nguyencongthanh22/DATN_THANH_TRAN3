// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/Method/api.dart';
import 'package:flutter_admin/models/user.dart';
import 'package:flutter_admin/view/detailStaffInfo.dart';

import '../models/UserClient.dart';
import 'detailUserInfo.dart';

class CardUserInfo extends StatefulWidget {
  const CardUserInfo({super.key});

  @override
  State<CardUserInfo> createState() => _CardStaffInfoState();
}

class _CardStaffInfoState extends State<CardUserInfo> {
  late Future<List<UserClient>> dataAdmin;
  void initState() {
    super.initState();
    dataAdmin = listuser();
  }

  late List<UserClient?> user = [];
  Dio dio = Dio();
  Future<List<UserClient>> listuser() async {
    String api = API().getUrl('/getProfileStatus');
    final respone = await dio.get(api,
        options: Options(
          headers: {'Accept': 'application/json'},
        ));
    if (respone.statusCode == 200) {
      List<dynamic> data = respone.data;
      List<UserClient> fechdata =
          data.map((json) => UserClient.fromJson(json)).toList();
      user.addAll(fechdata);
    }
    return user.cast<UserClient>();
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
          title: Text('Danh sách khách hàng'),
        ),
        body: FutureBuilder<List<UserClient>>(
            future: dataAdmin,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
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
                                builder: (context) => DetailUserInfo(email: snapshot.data![index].email,),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tài khoản: ${snapshot.data![index].email.toString().length < 22 ? snapshot.data![index].email.toString() : snapshot.data![index].email.toString().substring(0, 22)}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Tên: ${snapshot.data![index].name.toString().length < 22 ? snapshot.data![index].name.toString() : snapshot.data![index].email.toString().substring(0, 22)}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
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
