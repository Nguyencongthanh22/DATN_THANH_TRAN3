class Producvaritation {
  int? id;
  int? id_sp;
  int? id_size;
  String? Ten_size;
  int? id_color;
  String? name_color;
  int? so_luong;
  int? trangthai;
  bool imageUploaded;

  Producvaritation({
    this.id,
    this.id_sp,
    this.id_size,
    this.Ten_size,
    this.id_color,
    this.name_color,
    this.so_luong,
    this.trangthai,
    this.imageUploaded = false,
  });

  factory Producvaritation.fromJson(Map<String, dynamic> json) {
    return Producvaritation(
      id: json['id'] as int?,
      id_sp: json['id_sp'] as int?,
      id_size: json['id_size'] as int?,
      Ten_size: json['Ten_size'] as String?,
      id_color: json['id_color'] as int?,
      name_color: json['name_color'] as String?,
      so_luong: json['soluong'] as int?,
      trangthai: json['trangthai'] as int?,
    );
  }
}
