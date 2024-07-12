class OrderDetail {
  final int id;
  final int id_sp;
  final String tensp;
  final int soluong;
  final double gia;
  final String ten_color;
  final String ten_size;
  
  OrderDetail({
    required this.id,
    required this.id_sp,
    required this.tensp,
    required this.soluong,
    required this.gia,
    required this.ten_color,
    required this.ten_size,
   
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']) ?? 0,
      id_sp: json['id_sp'] is int
          ? json['id_sp']
          : int.tryParse(json['id_sp']) ?? 0,
      tensp: json['tensp'] ?? '',
      soluong: json['soluong'] is int
          ? json['soluong']
          : int.tryParse(json['soluong']) ?? 0,
      gia: json['gia'] is double
          ? json['gia']
          : double.tryParse(json['gia']) ?? 0,
      ten_color: json['ten_color'] ?? '',
      ten_size: json['ten_size'] ?? '',
     
    );
  }
}
