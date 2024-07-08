import 'package:flutter/material.dart';

class CardProduct {
  int? id;
  int? id_sp;
  String? ten;
  String? gia;
  int? soluong;
  String? ten_color;
  String? ten_size;
  String? email;
  CardProduct(
      {required this.id,
      required this.id_sp,
      required this.ten,
      required this.soluong,
      required this.ten_color,
      required this.ten_size,
      required this.gia,
      required this.email,});
  factory CardProduct.fromJson(Map<String, dynamic> json) {
    return CardProduct(
      id_sp: json['id_sp'] ?? '',
      id: json['id'] ?? '',
      soluong: json['soluong'],
      gia: json['gia'],
      ten: json['ten'],
      ten_size: json['ten_size'] ?? '',
      ten_color: json['ten_color'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
