class Image2 {
  int? id;
  String? image;
  int? id_sp;
  int? id_color;

  Image2({
    required this.id,
    required this.image,
    required this.id_sp,
    required this.id_color,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "url": image,
      "id_sp": id_sp,
      "id_color": id_color,
    };
  }

  factory Image2.fromJson(Map<String, dynamic> json) {
    return Image2(
      id: json['id'],
      image: json['image'],
      id_sp: json['id_sp'],
      id_color: json['id_color'],
    );
  }
}
