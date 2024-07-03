

import 'package:flutter/material.dart';

class Product {
  int? id_sp;
  String? ten;
  String? mota;
  String? gia;
  int? id_danhmuc;
 // int? trangthai;
  String id_email;
  Product({
    required this.id_sp,
    required this.ten,
    required this.mota,
    required this.gia,
    required this.id_danhmuc,
    //required this.trangthai,
    required this.id_email
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id_sp: json['id_sp'] ?? '',
      ten: json['ten'] ?? '',
      mota: json['mota'],
      gia: json['gia'],
      id_danhmuc: json['id_danhmuc'] ?? '',
   //   trangthai: json['trangthai'] ?? '',
      id_email: json['id_email']
    );
  }
}
