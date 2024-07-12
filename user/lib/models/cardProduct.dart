class CardProduct {
  int? id;
  int? id_sp;
  String? tensp;
  String? gia;
  int? soluong;
  String? ten_color;
  String? ten_size;
  String? email;
  int? trangthai;
  int? trangthai2;
  String? image; // Add image field

  CardProduct({
    required this.id,
    required this.id_sp,
    required this.tensp,
    required this.gia,
    required this.soluong,
    required this.ten_color,
    required this.ten_size,
    required this.email,
    required this.trangthai,
    required this.trangthai2,
    required this.image, // Initialize image field
  });

  factory CardProduct.fromJson(Map<String, dynamic> json) {
    return CardProduct(
      id_sp: json['id_sp'] ?? 0,
      id: json['id'] ?? 0,
      soluong: json['soluong'] ?? 1,
      gia: json['gia'] ?? '',
      tensp: json['tensp'] ?? '',
      ten_color: json['ten_color'] ?? '',
      ten_size: json['ten_size'] ?? '',
      email: json['email'] ?? '',
      trangthai: json['trangthai'] ?? 0,
      trangthai2: json['trangthai2'] ?? 0,
      image: json['image'], // Assign image field
    );
  }
}
