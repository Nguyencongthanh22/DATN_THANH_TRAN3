class User {
  String? name;
  String? email;
  String? diachi;
  DateTime? ngaysinh;
  String? gioitinh;
  String? sodienthoai;
  User(
      {required this.name,
      required this.email,
      required this.diachi,
   //   required this.ngaysinh,
      required this.gioitinh,
      required this.sodienthoai
      });
  Map<String, dynamic> tomap() {
    return {
      "name": name,
      "email":email,
      "diachi": diachi,
  //    "ngaysinh":ngaysinh,
      "gioitinh":gioitinh,
      "sodienthoai":sodienthoai
    };
  }
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      name:json['name']??'',
      email: json['email']??'',
      diachi:json['diachi']??'',
     // ngaysinh: DateTime.parse(json['ngaysinh']??''),
      gioitinh: json['gioitinh']??'',
      sodienthoai: json['sodienthoai']??''
    );
  }
}
