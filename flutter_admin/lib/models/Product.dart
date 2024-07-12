
import 'package:flutter_admin/models/Image.dart'; // Make sure to import Image2 correctly

class Products {
  int? id_sp;
  String? ten;
  String? mota;
  String? gia; // Depending on JSON structure, gia could be string or int
  int? id_danhmuc;
  String id_email;
  final List<Image2> images;

  Products({
    required this.id_sp,
    required this.ten,
    required this.mota,
    required this.gia,
    required this.id_danhmuc,
    required this.id_email,
    required this.images,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
  var imagesJson = json['images'] as List?;
  List<Image2> imagesList = [];

  if (imagesJson != null) {
    imagesList = imagesJson.map((i) => Image2.fromJson(i)).toList();
  }

  dynamic giaValue = json['gia'];
  if (giaValue is String) {
    giaValue = double.tryParse(giaValue) ?? 0;
  } else if (giaValue is! int) {
    giaValue = 0;
  }

  return Products(
    id_sp: json['id_sp'] as int?,
    ten: json['ten'] as String?,
    mota: json['mota'] as String?,
    gia: json['gia'] as String?,
    id_danhmuc: json['id_danhmuc'] as int?,
    id_email: json['id_email'] as String,
    images: imagesList,
  );
}

}
