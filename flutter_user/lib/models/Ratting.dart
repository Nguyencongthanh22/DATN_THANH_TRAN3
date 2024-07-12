class Rating {
  final int id_sp;
  final int id;
  final int diem;
  final String danhgia;
  final String? ngaydang;
  Rating(
      {required this.id_sp,
      required this.id,
      required this.diem,
      required this.danhgia,
      required this.ngaydang});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
        id_sp: json['id_sp'],
        id: json['id'],
        diem: json['diem'],
        danhgia: json['danhgia'],
        ngaydang: json['ngaydang']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id_sp': id_sp,
      'id_dh': id,
      'diem': diem,
      'danhgia': danhgia,
      'ngaydang': ngaydang,
    };
  }
}
