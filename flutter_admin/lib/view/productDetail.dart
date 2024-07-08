import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/view/numberUpDown.dart';
import 'package:flutter_admin/view/cardProducReview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Method/api.dart';
import '../models/Product.dart';
import '../models/ProductVaritation.dart';
import 'editProduct.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.id_sp}) : super(key: key);
  final int? id_sp;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Future<List<Products>> productdetail;
  late Future<List<Producvaritation>> productVariations;
  late Future<int?> futureQuyen;
  List<Products> pro = [];
  List<Producvaritation> vari = [];
  int? quyen;
  bool isLoading = false;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    productdetail = fetchData();
    productVariations = fetchVariations();
    futureQuyen = getUserQuyen();
    
    radioOptionsColor = getUniqueColors(vari);
     radioOptionsSize = getUniqueSizes(vari);
  }

  Future<List<Products>> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      String api = API().getUrl('/showIdProduct');
      final response = await dio.get(
        api,
        queryParameters: {'id_sp': widget.id_sp},
        options: Options(
          headers: {'Accept': 'application/json'},
          ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Products> fetchedProducts =
            data.map((json) => Products.fromJson(json)).toList();
        pro.addAll(fetchedProducts);
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
    return pro;
  }

  Future<List<Producvaritation>> fetchVariations() async {
    try {
      String api2 = API().getUrl('/getProductVaritication');
      final response2 = await dio.get(
        api2,
        queryParameters: {'id_sp': widget.id_sp},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      if (response2.statusCode == 200) {
        List<dynamic> data2 = response2.data;
        List<Producvaritation> fetchedProducts2 =
            data2.map((json) => Producvaritation.fromJson(json)).toList();
        vari.addAll(fetchedProducts2);
        radioOptionsColor = getUniqueColors(vari);
        radioOptionsSize = getUniqueSizes(vari);
      } else {
        print('Error fetching data: ${response2.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return vari;
  }

  Future<int?> getUserQuyen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    quyen = preferences.getInt('quyen');
    print('_____________________________quyền ${quyen}');
    return quyen;
  }

  List<RadioButtonModel> getUniqueColors(List<Producvaritation> variations) {
  final seenColors = <String>{};
  return variations.where((v) {
    // Filter out duplicates
    return seenColors.add(v.name_color ?? '');
  }).map((v) {
    // Map to RadioButtonModel
    return RadioButtonModel(
      isSelected: false,
      buttonText: v.name_color ?? '',
    );
  }).toList();
}

List<RadioButtonModel> getUniqueSizes(List<Producvaritation> variations) {
  final seenSizes = <String>{};
  return variations.where((v) {
    // Filter out duplicates
    return seenSizes.add(v.Ten_size ?? '');
  }).map((v) {
    // Map to RadioButtonModel
    return RadioButtonModel(
      isSelected: false,
      buttonText: v.Ten_size ?? '',
    );
  }).toList();
}


  List<RadioButtonModel> radioOptionsColor = [];
  List<RadioButtonModel> radioOptionsSize = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
        title: Text('Product Detail'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Products>>(
        future: productdetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            Products product = snapshot.data!.first;
            return FutureBuilder<List<Producvaritation>>(
              future: productVariations,
              builder: (context, variSnapshot) {
                if (variSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (variSnapshot.hasError) {
                  return Center(child: Text('Error: ${variSnapshot.error}'));
                } else if (!variSnapshot.hasData ||
                    variSnapshot.data!.isEmpty) {
                  return Center(child: Text('No variations found'));
                } else {
                  vari = variSnapshot.data!;

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.ten ?? "Tên sản phẩm",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("5/5", style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),
                        Container(
                          height: 250,
                          width: double.infinity,
                          child: Placeholder(),
                        ),
                        SizedBox(height: 16),
                        Text("Màu sắc", style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            for (var option in radioOptionsColor)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print(
                                        'Selected color: ${option.isSelected}');
                                    for (var other in radioOptionsColor) {
                                      if (other != option) {
                                        other.isSelected = false;
                                      }
                                    }
                                    option.isSelected = true;
                                  });

                                  print('Selected color: ${option.buttonText}');
                                  print('Selected color: ${option.isSelected}');
                                },
                                child: SquareRadioButtonItem(option),
                              ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text("Kích cỡ", style: TextStyle(fontSize: 18)),
                        Row(
                          children: [
                            for (var option in radioOptionsSize)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                   for (var other in radioOptionsColor) {
                                      if (other != option) {
                                        other.isSelected = false;
                                      }
                                    }
                                    option.isSelected = true;
                                  });
                                },
                                child: SquareRadioButtonItem(option),
                              ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text("Số lượng", style: TextStyle(fontSize: 18)),
                        Container(
                          margin: EdgeInsets.all(15),
                          height: 50,
                          width: 200,
                          child: NumberUpDown(onChanged: (int) {}),
                        ),
                        SizedBox(height: 35),
                        Text(
                          '${product.gia} VND ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Mô tả",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.mota ?? '',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Đánh giá",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 300,
                          width: double.infinity,
                          child: CardReview(),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: MaterialButton(
                color: Colors.red[400],
                onPressed: () {
                  quyen == 1
                      ? showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text('Bạn có chắc chắn muốn sửa',
                                    style: TextStyle(color: Colors.black)),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.red[
                                              400], // Thay đổi màu chữ thành đỏ
                                        ),
                                        child: Text(
                                          'Không',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.red[
                                                400], // Thay đổi màu chữ thành đỏ
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditProduct(id_sp: widget.id_sp,)));
                                          },
                                          child: Text(
                                            'Đồng ý',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )),
                                    ],
                                  )
                                ]);
                          })
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(
                                  child: Column(children: [
                                Text(
                                  'Bạn cần có quyền để sửa sản phẩm',
                                  style: TextStyle(color: Colors.red),
                                )
                              ])),
                            );
                          },
                        );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sửa',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 16), // Khoảng cách giữa hai button
            Expanded(
              child: MaterialButton(
                color: Colors.red[400],
                onPressed: () {
                  quyen == 1
                      ? showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text('Bạn có chắc chắn muốn xóa',
                                    style: TextStyle(color: Colors.black)),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.red[
                                              400], // Thay đổi màu chữ thành đỏ
                                        ),
                                        child: Text(
                                          'Không',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.red[
                                                400], // Thay đổi màu chữ thành đỏ
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'Đồng ý',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )),
                                    ],
                                  )
                                ]);
                          })
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(
                                  child: Column(children: [
                                Text(
                                  'Bạn cần có quyền để xóa sản phẩm',
                                  style: TextStyle(color: Colors.red),
                                )
                              ])),
                            );
                          },
                        );
                  ;
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Text(
                    'Xóa',
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

class RadioButtonModel {
  late bool isSelected;
  final String buttonText;

  RadioButtonModel({
    required this.isSelected,
    required this.buttonText,
  });
}

class SquareRadioButtonItem extends StatelessWidget {
  final RadioButtonModel _item;

  const SquareRadioButtonItem(this._item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Text(
                _item.buttonText,
                style: TextStyle(
                  color: _item.isSelected ? Colors.white : Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected ? Colors.red[200] : Colors.transparent,
              border: Border.all(
                width: 1.0,
                color: _item.isSelected ? Colors.red : Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(2.0)),
            ),
          ),
        ],
      ),
    );
  }
}
