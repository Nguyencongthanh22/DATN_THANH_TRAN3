

class Products {
  int? id_sp;
  String? ten;
  String? mota;
  String? gia;
  int? id_danhmuc;
  String id_email;
  Products({
    required this.id_sp,
    required this.ten,
    required this.mota,
    required this.gia,
    required this.id_danhmuc,
    required this.id_email
  });
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id_sp: json['id_sp'] ?? '',
      ten: json['ten'] ?? '',
      mota: json['mota'],
      gia: json['gia'],
      id_danhmuc: json['id_danhmuc'] ?? '',
      id_email: json['id_email']
    );
  }
}
