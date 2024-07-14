import 'dart:convert';

import 'package:dio/dio.dart';

Dio dio = Dio();
List<Order?> Cardproducts = [];

class Order {
  int id;
  String? email;
  String? tongtien;
  String? diachi;
   String? ngaydat;
  String image;
  String? trangthai;
  String? email_nv;

  Order({
    required this.id,
    required this.email,
    required this.image,
    required this.tongtien,
    required this.diachi,
    required this.trangthai,
    required this.email_nv,
    required this.ngaydat
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
       email_nv: json['email_nv'] ?? '',
      image: json['image'] ?? '',
      tongtien: json['tongtien'] ?? '',
      diachi: json['diachi'] ?? '',
      trangthai: json['trangthai'] ?? '',
      ngaydat:json['ngaydat']??''
    );
  }
}
