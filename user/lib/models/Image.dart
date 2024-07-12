class Image2 {
  int? id_anh;
  String? image;
  int? id_sp;
  int? id_color;

  Image2({
    required this.id_anh,
    required this.image,
    required this.id_sp,
    required this.id_color,
  });

  Map<String, dynamic> toMap() {
    return {
      "id_anh": id_anh,
      "image": image,
      "id_sp": id_sp,
      "id_color": id_color,
    };
  }

  factory Image2.fromJson(Map<String, dynamic> json) {
    return Image2(
      id_anh: json['id_anh'],
      image: json['image'],
      id_sp: json['id_sp'],
      id_color: json['id_color'],
    );
  }
}
