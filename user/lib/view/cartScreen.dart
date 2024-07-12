import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../methods/api.dart';
import '../models/cardProduct.dart';
import 'paymentScreen.dart';
import 'paymentScreen2.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Stream<List<CardProduct>> streamCardProduct;
  List<CardProduct?> Cardproducts = [];
  String? email;
  bool isLoading = false;
  Dio dio = Dio();
  double tongtien = 0.0;

  @override
  void initState() {
    super.initState();
    streamCardProduct = fetchDataStream();
  }

  Future<String?> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email');
    return email;
  }

  Stream<List<CardProduct>> fetchDataStream() async* {
    setState(() {
      isLoading = true;
    });

    email = await getUserEmail();

    try {
      Cardproducts.clear();

      String api = API().getUrl('/getCartProduct');
      final response = await dio.get(
        api,
        queryParameters: {'email': email},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<CardProduct> fetchedProducts = data.map((json) => CardProduct.fromJson(json)).toList();
        Cardproducts.addAll(fetchedProducts);
        setState(() {
          tongtien = calculateTotal(); 
        });
        print('______________________${Cardproducts}');
        yield Cardproducts.cast<CardProduct>();
      } else {
        print('Error fetching data: ${response.statusCode}');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  double calculateTotal() {
    double total = 0.0;
    for (var product in Cardproducts) {
      total += (double.parse(product!.gia!) * product.soluong!);
    }
    return total;
  }

  Future<void> deleteCardProduct(int id) async {
    try {
      String api = API().getUrl('/cardproduct/$id');
      final response = await dio.delete(
        api,
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          Cardproducts.removeWhere((product) => product?.id == id);
        });
        print('Product deleted successfully');
        print('Error deleting product: ${response.statusCode}');
      } else {
        print('Error deleting product: ${response.statusCode}');
        if (response.statusCode == 404) {
        } else {
        }
      }
    } catch (e) {
      print('Error deleting product: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Giỏ hàng',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
      ),
      body: StreamBuilder<List<CardProduct>>(
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
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                double gia = double.parse(snapshot.data![index].gia!) *
                    snapshot.data![index].soluong!;
                print('_______________${gia}');

                print('_______________tong tien${tongtien}');
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                             'https://humbly-sacred-mongrel.ngrok-free.app/storage/${snapshot.data![index].image}',),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, bottom: 4.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].tensp ?? '',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
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
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                size: 30,
                              ),
                              onPressed: () {
                                deleteCardProduct(
                                    snapshot.data![index].id ?? 0);
                              },
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
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(246, 238, 238, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${tongtien} VND",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            Container(
              width: 150,
              height: 80,
              color: Colors.red[400],
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => paymentScreenCard()));
                },
                child: Text(
                  "Thanh toán",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
