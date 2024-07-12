class Coupon {
  int? id;
  String? tenct;
  int? phantram;
  String? mota;
  int? id_danhmuc;
  int? trangthai;
  String? ngaytao;
  Coupon(
      {required this.id,
      required this.tenct,
      required this.mota,
      required this.phantram,
      required this.ngaytao,
      required this.id_danhmuc,
      required this.trangthai});
  Map<String, dynamic> tomap() {
    return {
      "id": id,
      "tenct": tenct,
      "mota": mota,
      "phantram": phantram,
      "id_danhmuc": id_danhmuc,
      'ngaytao':ngaytao,
      "trangthai": trangthai,
    };
  }

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
        id: json['id'],
        tenct: json['tenct'] ?? '',
        mota: json['mota'] ?? '',
        phantram: json['phantram'] ?? '',
        id_danhmuc: json['id_danhmuc'] ?? '',
        ngaytao: json['ngaytao']??'',
        trangthai: json['trangthai'] ?? '');
  }
}
