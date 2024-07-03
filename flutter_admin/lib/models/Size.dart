class Size2 {
  int? id_size;
  String? ten_size;
  Size2(
      {required this.id_size,
      required this.ten_size,
      });
  Map<String, dynamic> tomap() {
    return {
      "id_size": id_size,
      "ten_size":ten_size,
    };
  }
  factory Size2.fromJson(Map<String, dynamic> json){
    return Size2(
      id_size:json['id_size']??'',
      ten_size: json['ten_size']??'',
    );
  }
}
