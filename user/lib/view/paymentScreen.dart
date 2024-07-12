import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../methods/api.dart';
import '../models/cardProduct.dart';

class paymentScreen extends StatefulWidget {
  const paymentScreen({
    super.key,
  });
  @override
  State<paymentScreen> createState() => _PaymentScreenState();
}

late Future<Map<String, String?>> userInfoFuture;
late Future<String?> futureemail;
late Future<String?> futurediachi;
late Stream<List<CardProduct>> streamCardProduct;

class _PaymentScreenState extends State<paymentScreen> {
  @override
  void initState() {
    super.initState();
    userInfoFuture = getUserInfo();
    streamCardProduct = fetchDataStream();
    futurediachi = getUserdiachi();
    futureemail = getUserEmail();
  }

  String? email;
  Future<String?> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email');
    print('_________________${email}');
    return email;
  }

  Future<Map<String, String?>> getUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return {
      'name': preferences.getString('name'),
      'diachi': preferences.getString('diachi'),
      'sodienthoai': preferences.getString('sodienthoai')
    };
  }

  List<CardProduct?> Cardproducts = [];
  int? id;
  bool isLoading = false;
  Dio dio = Dio();
  double tongtien = 0.0;
  double total = 0.0;
  int? soluong;
  int? id_sp;
  String? tensp;
  String? tenmau;
  String? tensize;
  String? image;
  double? gia;
  double calculateTotal() {
    total = 0.0;
    for (var product in Cardproducts) {
      soluong = product!.soluong;
      tensp = product.tensp;
      tenmau = product.ten_color;
      tensize = product.ten_size;
      id_sp = product.id_sp;
    //  image = product.image;
      gia = double.parse(product.gia ?? '');

      print('________${id_sp}');
      total += (double.parse(product.gia!) * product.soluong!);
    }
    return total;
  }

  Stream<List<CardProduct>> fetchDataStream() async* {
    setState(() {
      isLoading = true;
    });

    try {
      Cardproducts.clear();

      String api = API().getUrl('/getCartProduct2');
      final response = await dio.get(
        api,
        queryParameters: {
          'trangthai2': 1,
        },
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<CardProduct> fetchedProducts =
            data.map((json) => CardProduct.fromJson(json)).toList();

        print('${response.data}');
        Cardproducts.addAll(fetchedProducts);
        setState(() {
          tongtien = calculateTotal();
        });
        ;
        yield Cardproducts.cast<CardProduct>();
      } else {}

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      //print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  String? diachi;
  Future<String?> getUserdiachi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    diachi = preferences.getString('diachi');
    print('_________________dia chi ${diachi}');
    return diachi;
  }

  Future<void> AddOrders2() async {
    final data = {
      'email': email,
      'tongtien': total,
      'diachi': diachi,
      'trangthai': 'choxacnhan',
    };

    try {
      final result = await API().postRequset2(route: '/AddOrder2', data: data);
      final response = jsonDecode(result.body);
      id = response['id'];
      print('_____________id_donhang${id}');
      if (response['status'] == 200) {
        await addOrderDetail();
      } else {
        print('Error: ${response['message']}');
      }
    } catch (e) {
      print('Error adding order: $e');
    }
  }

  Future<void> addOrderDetail() async {
    final data2 = {
      'id': id,
      'id_sp': id_sp,
      'tensp': tensp,
      'soluong': soluong,
      'gia': gia,
      'ten_size': tensize,
      'ten_color': tenmau,
    };

    try {
      final result =
          await API().postRequset2(route: '/AddOrderDetail', data: data2);
      final response = jsonDecode(result.body);

      if (response['status'] == 200) {
        print('Order detail added successfully');
      } else {
        print('Error adding order detail: ${response['message']}');
      }
    } catch (e) {
      print('Error adding order detail: $e');
    }
  }

  Future<void> deleteCardProduct() async {
    try {
      String api = API().getUrl('/deleteCartProduct2');
      // final response = await dio.delete(
      //   api,
      //   options: Options(
      //     headers: {'Accept': 'application/json'},
      //   ),
      // );
      final response = await dio.delete(
        api,
        options: Options(
          headers: {'Accept': 'application/json'},
          validateStatus: (_) =>
              true, // Bỏ qua validateStatus cho mọi status code
        ),
      );

      if (response.statusCode == 500) {
        print('Server error: ${response.statusMessage}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Server error. Please try again later.'),
          ),
        );
      } else if (response.statusCode == 200) {
        setState(() {
          Cardproducts.removeWhere((product) => product?.trangthai2 == 1);
          tongtien = calculateTotal();
        });
        print('Product deleted successfully');
      } else {
        print('Error deleting product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting product: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text("Đặt Hàng"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () async {
            await deleteCardProduct();
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<Map<String, String?>>(
                  future: userInfoFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error loading user info');
                    } else if (snapshot.hasData) {
                      var userInfo = snapshot.data!;
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 20,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  ' ${userInfo['diachi']}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.account_circle_rounded,
                                  size: 20,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  '${userInfo['name']}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.phone,
                                  size: 20,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  '${userInfo['sodienthoai']}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Text('No user info found');
                    }
                  },
                ),
                StreamBuilder<List<CardProduct>>(
                  stream: streamCardProduct,
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
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          double gia =
                              double.parse(snapshot.data![index].gia!) *
                                  snapshot.data![index].soluong!;
                          return Card(
                            child: Column(
                              children: [
                                SizedBox(height: 18),
                                Container(
                                  margin: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(246, 238, 238, 1),
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(18),
                                        bottom: Radius.circular(18)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(10),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    'https://humbly-sacred-mongrel.ngrok-free.app/storage/${snapshot.data![index].image}',
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top:
                                                            Radius.circular(18),
                                                        bottom: Radius.circular(
                                                            18)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.0, bottom: 4.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data![index].tensp ??
                                                      '',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.start,
                                                ),
                                                Text(
                                                    "Màu sắc: ${snapshot.data![index].ten_color ?? ''}"),
                                                Text(
                                                    "Kích cỡ: ${snapshot.data![index].ten_size ?? ''}"),
                                                Text(
                                                  "Số lượng: ${snapshot.data![index].soluong ?? ''}",
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Giá '),
                                                    Text('$gia'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Tổng số tiền: ${total}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Chi tiết thanh toán',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng tiền hàng: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('${total}'),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng tiền phí vận chuyển',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '2323',
                        style: TextStyle(fontSize: 15),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng thanh toán',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '12322',
                        style: TextStyle(fontSize: 18, color: Colors.red[400]),
                      )
                    ]),
              ],
            ),
          ),
        )
      ]),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tổng thanh toán:'),
                    Text('100000',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                color: Colors.red[400],
                onPressed: () {
                  AddOrders2();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Text(
                    'Đặt ngay',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
