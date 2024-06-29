class Category {
  int? id_danhmuc;
  String? tendanhmuc;
  int? id_cha;
  int? cap;
  Category(
      {required this.id_danhmuc,
      required this.tendanhmuc,
      required this.id_cha,
      required this.cap,
      });
  Map<String, dynamic> tomap() {
    return {
      "id_danhmuc": id_danhmuc,
      "tendanhmuc":tendanhmuc,
      "id_cha": id_cha,
      "cap":cap,
    };
  }
  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id_danhmuc:json['id_danhmuc']??'',
      tendanhmuc: json['tendanhmuc']??'',
      id_cha:json['id_cha']??'',
      cap: json['cap']??'',
    );
  }
}
