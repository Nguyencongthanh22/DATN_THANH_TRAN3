class User {
  String? name;
  String? email;
  String? diachi;
  String? gioitinh;
  String? sodienthoai;
  int? trangthai;
  DateTime? ngaysinh;
  int? quyen;
  String? ngaytao;
  User(
      {required this.name,
      required this.email,
      required this.diachi,
      required this.quyen,
      required this.gioitinh,
      required this.ngaysinh,
      required this.ngaytao,
      required this.sodienthoai,
      required this.trangthai});
  Map<String, dynamic> tomap() {
    return {
      "name": name,
      "email": email,
      "diachi": diachi,
      "quyen": quyen,
      "gioitinh": gioitinh,
      "ngaysinh": ngaysinh,
     'ngaytao': ngaytao,
      "sodienthoai": sodienthoai,
      'trangthai': trangthai,
    };
  }

  factory User.fromJson2(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      diachi: json['diachi'],
      quyen: json['quyen'],
      ngaysinh: DateTime.parse(json['ngaysinh']),
      gioitinh: json['gioitinh'],
      ngaytao: json['ngaytao'],
      sodienthoai: json['sodienthoai'],
      trangthai: json['trangthai'],
    );
  }
  factory User.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(String dateString) {
      try {
        return DateTime.parse(dateString);
      } catch (e) {
        print('Error parsing date: $e');
        return null;
      }
    }

    return User(
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        diachi: json['diachi'] ?? '',
        quyen: json['quyen'] ?? '',
        ngaysinh: DateTime.parse(json['ngaysinh'] ?? ''),
        gioitinh: json['gioitinh'] ?? '',
        sodienthoai: json['sodienthoai'] ?? '',
        ngaytao: json['ngaytao'],
        trangthai: json['trangthai'] ?? '');
  }

  void addAll(List<User> fechdata) {}
}
