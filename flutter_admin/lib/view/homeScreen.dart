import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Method/api.dart';
import '../models/Category.dart';
import 'package:flutter_admin/models/Product.dart';
import 'addProduct.dart';
import 'package:flutter_admin/view/cardProduct.dart';

import 'productDetail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeScreen> {
  late Future<List<Category2>> futureCategory2;
  late Future<List<Category2>> futureCategory;
  late Future<List<Category2>> futureCategory3;
  late Future<bool> futureAuth;
  late Future<int?> futureQuyen;
  late Future<String?> futureEmail;
  late Future<List<Products>> futureProduct;
  void initState() {
    super.initState();
    futureCategory = fetchData();
    futureCategory2 = fetchData2();
    futureCategory3 = fetchData3();
    futureAuth = isAuthenticated();
    futureQuyen = getUserQuyen();
    futureEmail = getUserEmail();
    futureProduct = fetchProduct2();
  }

  Dio dio = Dio();
  List<int> categoryIds = [1, 2, 3, 4];
  List<int> categoryid_cha = [0];
  List<int> categoryIdscha2 = [
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32
  ];
  List<int> categorycap = [1];
  List<int> categorycap2 = [2];
  List<int> categorycap3 = [3];
  List<Category2> categories2 = []; // Danh sách các id danh mục
  List<Category2> categories3 = [];
  String? email;
  int? quyen;
  List<Products?> products = [];
  bool isLoading = false;

  Future<List<Products>> fetchProduct2() async {
    setState(() {
      isLoading = true;
    });

    try {
      products.clear();

      String api = API().getUrl('/ShowproductAll2');
      final response = await dio.get(
        api,
        queryParameters: {'trangthai': 1},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Products> fetchedProducts =
            data.map((json) => Products.fromJson(json)).toList();
        products.addAll(fetchedProducts);
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
    return products.cast<Products>();
  }

  Future<List<Category2>> fetchData() async {
    List<Category2> categories = [];

    try {
      // Gửi yêu cầu GET cho từng id danh mục trong danh sách
      for (int id in categoryIds) {
        for (int id_cha in categoryid_cha) {
          for (int cap in categorycap) {
            String api = API().getUrl('/Category2');
            final response = await dio.get(
              api,
              queryParameters: {'id_danhmuc': id, 'id_cha': id_cha, 'cap': cap},
              options: Options(
                headers: {
                  'Accept': 'application/json',
                },
              ),
            );
            print('________________${response.data}');
            // Check if response data is valid
            if (response.statusCode == 200) {
              Category2 category = Category2.fromJson(response.data);
              if (category.id_danhmuc != null) {
                categories.add(category);
              } else {
                continue;
              }
            } else {
              print('Error fetching data: ${response.statusCode}');
              continue;
            }
          }
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    return categories; // Return list of Category objects
  }

  Future<List<Category2>> fetchData2() async {
    try {
      for (int id_cha in categoryIds) {
        for (int cap in categorycap2) {
          String api = API().getUrl('/Showid');
          final response = await dio.get(
            api,
            queryParameters: {'id_cha': id_cha, 'cap': cap},
            options: Options(
              headers: {
                'Accept': 'application/json',
              },
            ),
          );

          // Check if response data is valid
          if (response.statusCode == 200) {
            // Handle response.data as a list of objects
            List<dynamic> dataList = response.data as List<dynamic>;
            for (var data in dataList) {
              // Ensure data is of type Map<String, dynamic>
              if (data is Map<String, dynamic>) {
                Category2 category2 = Category2.fromJson(data);
                if (category2.id_danhmuc != null) {
                  categories2.add(category2);
                }
              }
            }
          } else {
            print('Error fetching data: ${response.statusCode}');
          }
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    return categories2; // Return list of Category2 objects
  }

  Future<List<Category2>> fetchData3() async {
    try {
      for (int id_cha in categoryIdscha2) {
        for (int cap in categorycap3) {
          String api = API().getUrl('/Showid2');
          final response = await dio.get(
            api,
            queryParameters: {'id_cha': id_cha, 'cap': cap},
            options: Options(
              headers: {
                'Accept': 'application/json',
              },
            ),
          );

          // Check if response data is valid
          if (response.statusCode == 200) {
            // Handle response.data as a list of objects
            List<dynamic> dataList = response.data as List<dynamic>;
            for (var data in dataList) {
              // Ensure data is of type Map<String, dynamic>
              if (data is Map<String, dynamic>) {
                Category2 category32 = Category2.fromJson(data);
                if (category32.id_danhmuc != null) {
                  categories3.add(category32);
                }
              }
            }
          } else {
            print('Error fetching data: ${response.statusCode}');
          }
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    return categories3; // Return list of Category2 objects
  }

  Future<bool> isAuthenticated() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    return token != null;
  }

  Future<String?> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return email = preferences.getString('email');
  }

  Future<int?> getUserQuyen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    quyen = preferences.getInt('quyen');
    print('_____________________________${quyen}');
    return quyen;
  }

  final List<String> imagelist = [
    "assets/hinh.jpg",
    "assets/hinh2.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.47,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(),
                            );
                          },
                        ),
                        InkWell(
                          child: Text(
                            "Bạn đang tìm kiếm gì?",
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          if (quyen == 1) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return FutureBuilder<List<Category2>>(
                                  future: futureCategory,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child:
                                              Text('Error: ${snapshot.error}'));
                                    } else if (!snapshot.hasData ||
                                        snapshot.data!.isEmpty) {
                                      return Center(
                                          child: Text('No data available'));
                                    } else {
                                      List<Category2> categories =
                                          snapshot.data!;
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: Column(
                                          children: [
                                            ButtonBar(
                                              alignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                for (int i = 0;
                                                    i < categories.length;
                                                    i++)
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return FutureBuilder<
                                                              List<Category2>>(
                                                            future:
                                                                futureCategory2,
                                                            builder: (context,
                                                                snapshot) {
                                                              if (snapshot
                                                                      .connectionState ==
                                                                  ConnectionState
                                                                      .waiting) {
                                                                return Center(
                                                                    child:
                                                                        CircularProgressIndicator());
                                                              } else if (snapshot
                                                                  .hasError) {
                                                                return Center(
                                                                    child: Text(
                                                                        'Error: ${snapshot.error}'));
                                                              } else if (!snapshot
                                                                      .hasData ||
                                                                  snapshot.data!
                                                                      .isEmpty) {
                                                                return Center(
                                                                    child: Text(
                                                                        'No data available'));
                                                              } else {
                                                                // List<Category2> categories2t = snapshot.data!;
                                                                // categories2t = categories2.where((category) => category.id_cha == categories[i].id_danhmuc).toList();
                                                                //List<Category2>
                                                                List<Category2>
                                                                    categories22 =
                                                                    snapshot
                                                                        .data!;
                                                                categories22 = categories2
                                                                    .where((category) =>
                                                                        category
                                                                            .id_cha ==
                                                                        categories[i]
                                                                            .id_danhmuc)
                                                                    .toList();
                                                                return AlertDialog(
                                                                  title: Column(
                                                                    children: [
                                                                      ButtonBar(
                                                                        alignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          for (int j = 0;
                                                                              j < categories22.length;
                                                                              j++)
                                                                            ElevatedButton(
                                                                              onPressed: () {
                                                                                showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return FutureBuilder<List<Category2>>(
                                                                                      future: futureCategory3,
                                                                                      builder: (context, snapshot) {
                                                                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                                                                          return Center(child: CircularProgressIndicator());
                                                                                        } else if (snapshot.hasError) {
                                                                                          return Center(child: Text('Error: ${snapshot.error}'));
                                                                                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                                                                          return Center(child: Text('No data available'));
                                                                                        } else {
                                                                                          //List<Category2>
                                                                                          List<Category2> categories32 = snapshot.data!;
                                                                                          categories32 = categories3.where((category) => category.id_cha == categories22[j].id_danhmuc).toList();
                                                                                          //print('_____________-${categories32}');
                                                                                          return AlertDialog(
                                                                                            title: Column(
                                                                                              children: [
                                                                                                ButtonBar(
                                                                                                  alignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    for (int h = 0; h < categories32.length; h++)
                                                                                                      if (categories32.isNotEmpty)
                                                                                                        ElevatedButton(
                                                                                                          child: Text(
                                                                                                            categories32.isNotEmpty
                                                                                                                ? categories32[h]?.cap == 3
                                                                                                                    ? categories32[h]?.tendanhmuc ?? 'khong'
                                                                                                                    : 'khong'
                                                                                                                : 'Loading...',
                                                                                                          ),
                                                                                                          onPressed: () {
                                                                                                            Navigator.push(
                                                                                                                context,
                                                                                                                MaterialPageRoute(
                                                                                                                    builder: (context) => AddProduct(
                                                                                                                          id_cha: categories32[h]?.id_danhmuc,
                                                                                                                        )));
                                                                                                          },
                                                                                                        )
                                                                                                  ],
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Text(
                                                                                categories22.isNotEmpty
                                                                                    ? categories22[j]?.cap == 2
                                                                                        ? categories22[j]?.tendanhmuc ?? 'khong'
                                                                                        : 'khong'
                                                                                    : 'Loading...',
                                                                              ),
                                                                            )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      categories.isNotEmpty
                                                          ? categories[i]?.id_cha ==
                                                                      0 &&
                                                                  categories[i]
                                                                          ?.cap ==
                                                                      1
                                                              ? categories[i]
                                                                      ?.tendanhmuc ??
                                                                  'khong'
                                                              : 'khong'
                                                          : 'Loading...',
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(
                                      child: Column(children: [
                                    Text('Bạn cần có quyền để thêm sản phẩm')
                                  ])),
                                );
                              },
                            );
                          }
                        },
                        child: Icon(Icons.add),
                        backgroundColor: Colors.red[200],
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
              
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: 1.0,
                    ),
                    items: imagelist.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                            ),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  FutureBuilder<List<Products>>(
                    future: futureProduct,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text('No products available');
                      } else {
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                              id_sp:
                                                  snapshot.data![index].id_sp,
                                            )));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 170,
                                          width: 230,
                                          child: Image.asset(
                                            'assets/hinh.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Text(snapshot.data![index].ten ?? ''),
                                        Text(snapshot.data![index].gia ?? ''),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Kết quả tìm kiếm cho: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Gợi ý tìm kiếm'),
    );
  }
}
