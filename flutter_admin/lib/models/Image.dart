class Image {
  int? id_anh;
  String? url;
  int? id_sp;
  int? id_color;
  Image(
      {required this.id_anh,
      required this.url,
      required this.id_sp,
      required this.id_color,
      });
  Map<String, dynamic> tomap() {
    return {
      "id_anh": id_anh,
      "url":url,
      "id_sp": id_sp,
      "id_color":id_color,
    };
  }
  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      id_anh:json['id_anh']??'',
      url: json['url']??'',
      id_sp:json['id_sp']??'',
      id_color: json['id_color']??'',
    );
  }
}
