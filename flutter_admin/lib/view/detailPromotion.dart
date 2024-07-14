
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/models/Coupon.dart';

import '../Method/api.dart';
import '../models/user.dart';
import 'listStaffInfo.dart';

class DetailPromotion extends StatefulWidget {
  const DetailPromotion({super.key, this.id});
  final int? id;
  @override
  State<DetailPromotion> createState() => _DetailPromotionState();
}

class _DetailPromotionState extends State<DetailPromotion> {
  bool isChecked = false;
  void initState() {
    super.initState();
    dataCoupon = getCoupon();
  }

  List<Coupon> user = [];
  Dio dio = Dio();
  late Future<Coupon> dataCoupon;

  Future<Coupon> getCoupon() async {
    String api = API().getUrl('/getCouponid');
    final response = await dio.get(api,
        queryParameters: {'id': widget.id},
        options: Options(
          headers: {'Accept': 'application/json'},
        ));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return Coupon.fromJson(data);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<void> refreshCoupon() async {
    setState(() {
      dataCoupon = getCoupon();
    });
  }

  int trangthai1 = 1;
  Future<void> updateTrangthai() async {
    String api = API().getUrl('/updateCoupon');
    try {
      final response = await Dio().put(
        api,
        data: {
          'id': widget.id,
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
    String api = API().getUrl('/updateCoupon');
    try {
      final response = await Dio().put(
        api,
        data: {
          'id': widget.id,
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
Future<void> refreshUser() async {
    setState(() {
      dataCoupon = getCoupon();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
          ),
          title: const Text('Thông tin nhân viên'),
        ),
        body: FutureBuilder<Coupon>(
            future: dataCoupon,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return Text('No products available');
              } else {
                Coupon coupon2 = snapshot.data!;
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
                                  'Tên chương trình: ${coupon2.tenct ?? ''}',
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
                                  'Phần trăm: ${coupon2.phantram ?? ''}',
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
                                  'Mô tả: ${coupon2.mota ?? ""}',
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
                                  'Ngày Tạo: ',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              coupon2.trangthai == 1
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
                                            'Kết thúc chương trình',
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
                                            'Khôi phục chương trình',
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
