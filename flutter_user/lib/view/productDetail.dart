// import 'package:flutter/material.dart';
// import 'package:flutter_user/view/numberUpDown.dart';
// import 'package:flutter_user/view/cardProducReview.dart';

// class ProductDetail extends StatefulWidget {
//   const ProductDetail({Key? key, required this.id_sp}) : super(key: key);
//   final int? id_sp;
//   // final String? mota;
//   //final
//   @override
//   State<ProductDetail> createState() => _ProductDetailState();
// }

// class _ProductDetailState extends State<ProductDetail> {
//   late List<RadioButtonModel> radioOptionsColor;
//   late List<RadioButtonModel> radioOptionsSize;

//   @override
//   void initState() {
//     super.initState();
//     radioOptionsColor = [
//       RadioButtonModel(isSelected: false, buttonText: 'Vàng'),
//       RadioButtonModel(isSelected: false, buttonText: 'Hồng'),
//       RadioButtonModel(isSelected: false, buttonText: 'Đen'),
//       RadioButtonModel(isSelected: false, buttonText: 'Trắng'),
//     ];
//     radioOptionsSize = [
//       RadioButtonModel(isSelected: false, buttonText: 'S'),
//       RadioButtonModel(isSelected: false, buttonText: 'M'),
//       RadioButtonModel(isSelected: false, buttonText: 'L'),
//       RadioButtonModel(isSelected: false, buttonText: 'XL'),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.red,
//             )),
//         title: Text('Product Detail'),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.shopping_cart_outlined,
//               color: Colors.red,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Tên sản phẩm",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text("5/5", style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Container(
//               height: 250,
//               width: double.infinity,
//               child: Placeholder(), // Thay bằng hình ảnh thực tế của sản phẩm
//             ),
//             SizedBox(height: 16),
//             Text("Màu sắc", style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 for (var option in radioOptionsColor)
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         print('Selected color: ${option.isSelected}');
//                         for (var other in radioOptionsColor) {
//                           if (other != option) {
//                             other.isSelected = false;
//                           }
//                         }
//                         print('Selected color: ${option.buttonText}');
//                         option.isSelected = !option.isSelected;
//                         print('Selected color: ${option.isSelected}');
//                       });
//                     },
//                     child: SquareRadioButtonItem(option),
//                   ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text("Kích cỡ", style: TextStyle(fontSize: 18)),
//             Row(
//               children: [
//                 for (var option in radioOptionsSize)
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         print('Selected color: ${option.isSelected}');
//                         for (var other in radioOptionsSize) {
//                           if (other != option) {
//                             other.isSelected = false;
//                           }
//                         }
//                         print('Selected color: ${option.isSelected}');
//                         print('Selected color: ${option.buttonText}');
//                         option.isSelected = !option.isSelected;
//                       });
//                     },
//                     child: SquareRadioButtonItem(option),
//                   ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Text("Số lượng", style: TextStyle(fontSize: 18)),
//             Container(
//               margin: EdgeInsets.all(15),
//               height: 50,
//               width: 200,
//               child: NumberUpDown(onChanged: (int) {}),
//             ),
//             SizedBox(height: 15),
//             Text("283.000 VND",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//             SizedBox(height: 25),
//             Text("Mô tả",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             Text(
//                 "Các phần lưới được ánh xạ (đan vào vải) chứ không phải khâu lại với nhau đảm bảo cảm giác êm ái, nhẹ nhàng.",
//                 style: TextStyle(
//                   fontSize: 15,
//                 )),
//             SizedBox(height: 30),
//             Text("Đánh giá",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             Container(
//                 margin: EdgeInsets.all(10),
//                 height: 300,
//                 width: double.infinity,
//                 child: CardReview())
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Expanded(
//               child: MaterialButton(
//                 color: Colors.red[400],
//                 onPressed: () {
//                   // Xử lý khi nhấn vào Thêm giỏ hàng
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 70,
//                   child: const Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.shopping_cart_outlined, color: Colors.white),
//                       Padding(
//                         padding: EdgeInsets.only(top: 5.0),
//                         // child: Text('Thêm giỏ hàng'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 16), // Khoảng cách giữa hai button
//             Expanded(
//               child: MaterialButton(
//                 color: Colors.red[400],
//                 onPressed: () {
//                   // Xử lý khi nhấn vào Mua ngay
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 70,
//                   child: const Text(
//                     'Mua ngay',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RadioButtonModel {
//   late bool isSelected;
//   final String buttonText;

//   RadioButtonModel({
//     required this.isSelected,
//     required this.buttonText,
//   });
// }

// class SquareRadioButtonItem extends StatelessWidget {
//   final RadioButtonModel _item;

//   const SquareRadioButtonItem(this._item, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(15.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             height: 50.0,
//             width: 50.0,
//             child: Center(
//               child: Text(
//                 _item.buttonText,
//                 style: TextStyle(
//                   color: _item.isSelected ? Colors.white : Colors.black,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: _item.isSelected ? Colors.red[200] : Colors.transparent,
//               border: Border.all(
//                 width: 1.0,
//                 color: _item.isSelected ? Colors.red : Colors.black,
//               ),
//               borderRadius: const BorderRadius.all(Radius.circular(2.0)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user/models/ProductVaritication.dart';
import 'package:flutter_user/models/product.dart';
import 'package:flutter_user/view/numberUpDown.dart';
import 'package:flutter_user/view/cardProducReview.dart';

import '../methods/api.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.id_sp}) : super(key: key);
  final int? id_sp;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Future<List<Product>> productdetail;
  late Future<List<Producvaritation>> productVariations;
  List<Product> pro = [];
  List<Producvaritation> vari = [];

  bool isLoading = false;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    productdetail = fetchData();
    productVariations = fetchVariations();
    radioOptionsColor = getUniqueColors(vari);
     radioOptionsSize = getUniqueSizes(vari);
  }

  Future<List<Product>> fetchData() async {
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
        List<Product> fetchedProducts =
            data.map((json) => Product.fromJson(json)).toList();
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

  List<RadioButtonModel> getUniqueColors(List<Producvaritation> variations) {
    final seen = <int>{};
    return variations.where((v) => seen.add(v.id_color!)).map((v) {
      return RadioButtonModel(
        // isSelected: false, // Default to false if null or not provided
        buttonText: v.name_color ?? '',
      );
    }).toList();
  }

  List<RadioButtonModel> getUniqueSizes(List<Producvaritation> variations) {
    final seen = <int>{};
    return variations.where((v) => seen.add(v.id_size!)).map((v) {
      return RadioButtonModel(
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
      body: FutureBuilder<List<Product>>(
        future: productdetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            Product product = snapshot.data!.first;
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
                                  setState(() {});
                                  print('Selected color: ${option.isSelected}');
                                  for (var other in radioOptionsColor) {
                                    if (other != option) {
                                      other.isSelected = false;
                                    }
                                  }
                                  option.isSelected = true;
                                  
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
                                    option.isSelected = !option.isSelected;
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
                  // Handle add to cart
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Thêm giỏ hàng',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: MaterialButton(
                color: Colors.red[400],
                onPressed: () {
                  // Handle buy now
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: Text(
                    'Mua ngay',
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
  bool isSelected = false;
  final String buttonText;

  RadioButtonModel({
    //required this.isSelected,
    required this.buttonText,
  });
}

class SquareRadioButtonItem extends StatelessWidget {
  final RadioButtonModel item;

  const SquareRadioButtonItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              child: Center(
                child: Text(
                  item.buttonText,
                  style: TextStyle(
                    color: item.isSelected ? Colors.white : Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: item.isSelected == true
                    ? Colors.red[200]
                    : Colors.transparent,
                border: Border.all(
                  width: 1.0,
                  color: item.isSelected ? Colors.red : Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
