import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../methods/api.dart';
import '../models/OrderDetail.dart';

class OrderProductDetail extends StatefulWidget {
  const OrderProductDetail({
    Key? key,
    required this.id,
    required this.trangthai,
  }) : super(key: key);

  final int id;
  final String trangthai;

  @override
  State<OrderProductDetail> createState() => _OrderProductDetailState();
}

class _OrderProductDetailState extends State<OrderProductDetail> {
  late Future<List<OrderDetail>> _orderDetail;
  late Future<String?> futurename;

  List<OrderDetail> orderdetail = [];
  String? name;
  int? _diem = 1;
  String? _danhgia;

  @override
  void initState() {
    super.initState();
    _orderDetail = _fetchOrderDetail();
    futurename = getUsername();
  }

  Future<String?> getUsername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString('name');
    print('___________${name}');
    return name;
  }

  Future<List<OrderDetail>> _fetchOrderDetail() async {
    try {
      String api = API().getUrl('/getOrderDetail');
      final response = await Dio().get(
        api,
        queryParameters: {'id': widget.id},
        options: Options(headers: {'Accept': 'application/json'}),
      );
      print('Response Data: ${response.data}'); // In dữ liệu trả về để kiểm tra

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<OrderDetail> fetchedProducts =
            data.map((json) => OrderDetail.fromJson(json)).toList();
        setState(() {
          orderdetail = fetchedProducts;
        });
        print('____________${response.statusCode}');
        return fetchedProducts;
      } else {
        throw Exception('Failed to load order detail');
      }
    } catch (e) {
      throw Exception('Failed to load order detail: $e');
    }
  }

  Future<void> addproduct(int id_sp) async {
    final data = {
      'id_sp': id_sp.toString(),
      'id': widget.id.toString(),
      'diem': _diem.toString(),
      'ten': name.toString(),
      'danhgia': _danhgia.toString(),
    };

    final result = await API().postRequset(route: '/addReview', data: data);
    final response = jsonDecode(result.body);

    if (response['status'] == 200) {
      print('Review submitted successfully');
    } else {
      print('Error________________: ${response['message']}');
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Chi tiết sản phẩm',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
      ),
      body: FutureBuilder<List<OrderDetail>>(
        future: _orderDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products available'));
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                OrderDetail orderDetail = snapshot.data![index];
                return widget.trangthai != 'dagiao'
                    ? Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                orderDetail.tensp,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Color: ${orderDetail.ten_color}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Size: ${orderDetail.ten_size}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Quantity: ${orderDetail.soluong}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total: ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '${orderDetail.gia}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                orderDetail.tensp,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Color: ${orderDetail.ten_color}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Size: ${orderDetail.ten_size}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Quantity: ${orderDetail.soluong}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total: ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '${orderDetail.gia}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                                'Đánh giá chất lượng sản phẩm'),
                                            content: Form(
                                              key: _formKey,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  DropdownButtonFormField<int>(
                                                    value: _diem,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _diem = value;
                                                      });
                                                    },
                                                    items: List.generate(
                                                            5,
                                                            (index) =>
                                                                index + 1)
                                                        .map((e) =>
                                                            DropdownMenuItem<
                                                                int>(
                                                              value: e,
                                                              child: Row(
                                                                children: List
                                                                    .generate(
                                                                        e,
                                                                        (index) =>
                                                                            Icon(
                                                                              Icons.star,
                                                                              color: Colors.yellow,
                                                                              size: 27,
                                                                            )),
                                                              ),
                                                            ))
                                                        .toList(),
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            'Điểm đánh giá'),
                                                    validator: (value) {
                                                      if (value == null) {
                                                        return 'Vui lòng chọn điểm đánh giá';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  TextFormField(
                                                    decoration: InputDecoration(
                                                        labelText: 'Đánh giá'),
                                                    onSaved: (value) {
                                                      _danhgia = value;
                                                    },
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Vui lòng nhập đánh giá';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  SizedBox(height: 20),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      if (_formKey.currentState
                                                              ?.validate() ??
                                                          false) {
                                                        _formKey.currentState
                                                            ?.save();
                                                        addproduct(
                                                            orderDetail.id_sp);
                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    },
                                                    child: Text('Gửi đánh giá'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Text('Đánh giá'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
              },
            );
          }
        },
      ),
    );
  }
}
