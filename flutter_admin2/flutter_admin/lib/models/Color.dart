class Color2 {
  int? id_color;
  String? ten_color;
  Color2(
      {required this.id_color,
      required this.ten_color,
      });
  Map<String, dynamic> tomap() {
    return {
      "id_color": id_color,
      "ten_color":ten_color,
    };
  }
  factory Color2.fromJson(Map<String, dynamic> json){
    return Color2(
      id_color:json['id_color']??'',
      ten_color: json['ten_color']??'',
    );
  }
}
