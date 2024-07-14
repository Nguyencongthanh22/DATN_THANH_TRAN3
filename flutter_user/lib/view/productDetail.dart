import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_user/models/ProductVaritication.dart';
import 'package:flutter_user/models/product.dart';
import 'package:flutter_user/view/numberUpDown.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../methods/api.dart';
import '../models/Image.dart';
import 'paymentScreen.dart';
import 'productreviews.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail(
      {Key? key,
      required this.id_sp,
      this.gia,
      this.tensp,
      this.giakm,
      this.hinh})
      : super(key: key);
  final int? id_sp;
  final double? gia;
  final String? tensp;
  final double? giakm;
  final String? hinh;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Future<List<Product>> productdetail;
  late Future<List<Producvaritation>> productVariations;
  late Future<List<Image2>> Imagess;
  late Future<Map<String, String?>> userInfoFuture;
  late Future<String?> futureEmail;
  late Future<String?> futurediachi;
  late Future<String?> futuresodienthoai;
  List<Product> pro = [];
  List<Image2> images = [];
  List<Producvaritation> vari = [];
  String? email;
  int? soluong2;
  bool isLoading = false;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    productdetail = fetchData();
    productVariations = fetchVariations();
    radioOptionsColor = getUniqueColors(vari);
    //  radioOptionsSize = getUniqueSizes(vari);
    futureEmail = getUserEmail();
    futurediachi = getUserdiachi();
    futuresodienthoai = getUsersodienthoai();
    Imagess = fetchDataImage();
  }

  String formatCurrency(double amount) {
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return formatter.format(amount);
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
      print('_______________gia   ${widget.gia}');
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

  Future<List<Image2>> fetchDataImage() async {
    setState(() {
      isLoading = true;
    });

    try {
      String api = API().getUrl('/getImageId_sp');
      final response = await dio.get(
        api,
        queryParameters: {'id_sp': widget.id_sp},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Image2> fetchedProducts =
            data.map((json) => Image2.fromJson(json)).toList();
        images.addAll(fetchedProducts);
        calculateTotal();
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
    return images;
  }

  List<RadioButtonModel> getUniqueSizesForColor(String? color) {
    final seenSizes = <String>{};
    return vari.where((v) => v.name_color == color).where((v) {
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
        // radioOptionsSize = getUniqueSizes(vari);
      } else {
        print('Error fetching data: ${response2.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return vari;
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

  Future<String?> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email');
    print('_________________${email}');
    print('____________giakm${widget.giakm}');
    return email;
  }

  String? diachi;
  Future<String?> getUserdiachi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    diachi = preferences.getString('diachi');
    print('_________________dia chi ${diachi}');

    return diachi;
  }

  String? image2;
  String? calculateTotal() {
    for (var images in images) {
      image2 = images!.image;

      print('________${image2}');
    }
    return image2;
  }

  String? sodienthoai;
  Future<String?> getUsersodienthoai() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    sodienthoai = preferences.getString('sodienthoai');
    print('_________________${sodienthoai}');
    return sodienthoai;
  }

  String? selectedColor;
  String? selectedSize;
  

  Future<Map<String, String?>> getUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return {
      'name': preferences.getString('name'),
      'diachi': preferences.getString('diachi'),
      'sodienthoai': preferences.getString('sodienthoai')
    };
  }

  void addproduct() async {
    final data = {
      'id_sp': widget.id_sp,
      'soluong': soluong2 == null ? 1 : soluong2,
      'tensp': widget.tensp,
      'ten_color': selectedColor,
      'gia': widget.giakm! <= widget.gia! ? widget.giakm : widget.gia ?? '',
      'ten_size': selectedSize,
      'email': email,
      'image': image2,
      'trangthai': 1
    };
    print('________${widget.gia}');
    final result = await API().postRequset2(route: '/AddCart', data: data);
    final response = jsonDecode(result.body);
    print('Response: $response');
    if (response['status'] == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đơn hàng đã được thêm vào giỏ hàng')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bạn vui lòng chọn kích thước và màu sắc sản phẩm')));
      print('Error________________: ${response['message']}');
    }
  }

  void addproduct2() async {
    final data = {
      'id_sp': widget.id_sp,
      'soluong': soluong2 == null ? 1 : soluong2,
      'tensp': widget.tensp,
      'ten_color': selectedColor,
      'gia': widget.giakm! <= widget.gia! ? widget.giakm : widget.gia ?? '',
      'ten_size': selectedSize,
      'email': email,
      'image': image2,
      'trangthai2': 1
    };
    print('________GIA${widget.giakm}');
    final result = await API().postRequset2(route: '/AddCart2', data: data);
    final response = jsonDecode(result.body);
    print('Response: $response');
    if (response['status'] == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => paymentScreen()));
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bạn vui lòng chọn kích thước và màu sắc sản phẩm')));
      print('Error________________: ${response['message']}');
    }
  }

  List<RadioButtonModel> radioOptionsColor = [];
  List<RadioButtonModel> radioOptionsSize = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.deepOrange[100],
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
                    return FutureBuilder<List<Image2>>(
                        future: Imagess,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('No data available'));
                          }

                          final images = snapshot.data!;
                          return SingleChildScrollView(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                               
                                Container(
                                  height: 250,
                                 // width: 900,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: images.length,
                                    itemBuilder: (context, index) {
                                      return Container(height: 300,width: 370,
                                        margin: EdgeInsets.only(right: 8),
                                        child: Image.network(
                                          'https://troll-touched-basically.ngrok-free.app/storage/${images[index].image}',
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  product.ten ?? "Tên sản phẩm",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                 SizedBox(height: 8),
                                Text("Màu sắc", style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Wrap(
                                  children: getUniqueColors(vari)
                                      .map(
                                        (option) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedColor = option.buttonText;
                                              radioOptionsSize =
                                                  getUniqueSizesForColor(
                                                      selectedColor);
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: option.buttonText ==
                                                          'Trắng'
                                                      ? selectedColor ==
                                                              option.buttonText
                                                          ? Colors.redAccent
                                                          : Colors.white
                                                      : option.buttonText ==
                                                              'Đỏ'
                                                          ? selectedColor ==
                                                                  option
                                                                      .buttonText
                                                              ? Colors.redAccent
                                                              : Colors.red[300]
                                                          : option.buttonText ==
                                                                  'Xanh dương'
                                                              ? selectedColor ==
                                                                      option
                                                                          .buttonText
                                                                  ? Colors
                                                                      .redAccent
                                                                  : Colors
                                                                      .blue[400]
                                                              : option.buttonText ==
                                                                      'Đen'
                                                                  ? selectedColor ==
                                                                          option
                                                                              .buttonText
                                                                      ? Colors
                                                                          .redAccent
                                                                      : Colors
                                                                          .black
                                                                  : option.buttonText ==
                                                                          'Hồng'
                                                                      ? selectedColor ==
                                                                              option
                                                                                  .buttonText
                                                                          ? Colors
                                                                              .redAccent
                                                                          : Colors
                                                                              .green
                                                                      : option.buttonText ==
                                                                              'Xanh lá'
                                                                          ? selectedColor == option.buttonText
                                                                              ? Colors.redAccent
                                                                              : Colors.green
                                                                          : option.buttonText == 'Vàng'
                                                                              ? selectedColor == option.buttonText
                                                                                  ? Colors.redAccent
                                                                                  : Colors.green
                                                                              : option.buttonText == 'Cam'
                                                                                  ? selectedColor == option.buttonText
                                                                                      ? Colors.redAccent
                                                                                      : Colors.green
                                                                                  : selectedColor == option.buttonText
                                                                                      ? Colors.redAccent
                                                                                      : Colors.green,
                                                  border: Border.all(color: Colors.black)),
                                              //child: Text(option.buttonText),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                Text(
                                  'Size',
                                  style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 16),
                                Wrap(
                                  children: getUniqueSizesForColor(
                                          selectedColor)
                                      .map((option) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedSize =
                                                    option.buttonText;
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    //
                                                    color: selectedSize ==
                                                            option.buttonText
                                                        ? Colors.red[200]
                                                        : Colors.white,
                                                    // ),
                                                    border: Border.all(
                                                        color: Colors.black)),
                                                child: Center(
                                                    child: Text(
                                                  option.buttonText,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                                SizedBox(height: 8),
                                Text("Số lượng",
                                    style: TextStyle(fontSize: 18)),
                                Container(
                                  margin: EdgeInsets.all(15),
                                  height: 50,
                                  width: 150,
                                  child: NumberUpDown(onChanged: (value) {
                                    setState(() {
                                      soluong2 = value;
                                    });
                                  }),
                                ),
                                SizedBox(height: 35),
                                Text(
                                  formatCurrency(double.parse(product.gia!)),
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
                                  child: CardReview(
                                    id_sp: widget.id_sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                });
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
                  addproduct();
                },
                child: InkWell(
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
            ),
            SizedBox(width: 16),
            Expanded(
              child: MaterialButton(
                color: Colors.red[400],
                onPressed: () {
                  addproduct2();
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
    required this.isSelected,
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
