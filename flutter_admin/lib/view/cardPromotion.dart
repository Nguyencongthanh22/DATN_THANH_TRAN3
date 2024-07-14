import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/Method/api.dart';
import 'package:flutter_admin/models/user.dart';

import 'package:flutter_admin/view/detailStaffInfo.dart';

import '../models/Coupon.dart';
import 'detailPromotion.dart';

class CardPromotion extends StatefulWidget {
  const CardPromotion({super.key, this.quyen});
  final int? quyen;
  @override
  State<CardPromotion> createState() => _CardStaffInfoState();
}

class _CardStaffInfoState extends State<CardPromotion> {
  late Future<List<Coupon>> dataPromotion;
  void initState() {
    super.initState();
    dataPromotion = listCoupon();
  }

  late List<Coupon?> user = [];
  Dio dio = Dio();
  Future<List<Coupon>> listCoupon() async {
    String api = API().getUrl('/getCoupon');
    final respone = await dio.get(api,
        //queryParameters: {'trangthai': 1},
        options: Options(
          headers: {'Accept': 'application/json'},
        ));
    if (respone.statusCode == 200) {
      List<dynamic> data = respone.data;
      print('_______________${widget.quyen}');
      List<Coupon> fechdata =
          data.map((json) => Coupon.fromJson(json)).toList();
      user.addAll(fechdata);
    } else {
      print('Error fetching data: ${respone.statusCode}');
    }
    return user.cast<Coupon>();
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
          title: Text('Danh sách khuyến mãi'),
        ),
        body: FutureBuilder<List<Coupon>>(
            future: dataPromotion,
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
                        child:  InkWell(
                          onTap: () {
                            widget.quyen==0?
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPromotion(
                                  id: snapshot.data![index].id,
                                ),
                              ),
                            ):'';
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
                                                'Tên chương trình: ${snapshot.data![index].tenct.toString().length < 15 ? snapshot.data![index].tenct.toString() : snapshot.data![index].tenct.toString().substring(0, 15)}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'Mô tả: ${snapshot.data![index].mota.toString().length < 15 ? snapshot.data![index].mota.toString() : snapshot.data![index].mota.toString().substring(0, 22)}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'Trạng thái: ${snapshot.data![index].trangthai == 1 ? 'Đang diễn ra' : 'Kết thúc'}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                              onPressed: () {},
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
                                                  Text(
                                                    'Tên chương trình: ${snapshot.data![index].tenct.toString().length < 15 ? snapshot.data![index].tenct.toString() : snapshot.data![index].tenct.toString().substring(0, 15)}',
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
                                                  Text(
                                                    'Mô tả: ${snapshot.data![index].mota.toString().length < 15 ? snapshot.data![index].mota.toString() : snapshot.data![index].mota.toString().substring(0, 22)}',
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
                                                    '${snapshot.data![index].trangthai == 0 ? 'Đã kết thúc' : ''}',
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
