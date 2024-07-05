import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_user/models/product.dart';
import 'package:flutter_user/view/productDetail.dart';
import '../methods/api.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<Product>> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchData2();
  }

  List<Product?> products = [];
  bool isLoading = false;
  Dio dio = Dio();

  Future<List<Product>> fetchData2() async {
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
        List<Product> fetchedProducts =
            data.map((json) => Product.fromJson(json)).toList();
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
    return products.cast<Product>();
  }

  Future<List<Product>> searchProducts(String query) async {
    try {
      String api = API().getUrl('/search');
      final response = await dio.get(
        api,
        queryParameters: {'ten': query},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        print('Error searching data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error searching data: $e');
      return [];
    }
  }

  final List<String> imagelist = [
    "assets/hinh.jpg",
    "assets/hinh2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.47,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(searchProducts),
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
                          delegate: CustomSearchDelegate(searchProducts),
                        );
                      },
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () async {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat_sharp),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
              FutureBuilder<List<Product>>(
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
                                          id_sp: snapshot.data![index].id_sp,
                                        )));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 170,
                                  width: 230,
                                  child: Image.asset(
                                    'assets/hinh.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                 Text(snapshot.data![index].ten ?? '',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                 Text(snapshot.data![index].gia ?? '',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
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
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final Future<List<Product>> Function(String) searchProducts;

  CustomSearchDelegate(this.searchProducts);

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
    return FutureBuilder<List<Product>>(
      future: searchProducts(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No products found'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return Column(
                children: [
                  Container(
                    color: Colors.grey[60],
                    height: 80,
                    child: ListTile(
                      title: Text(
                        product.ten ?? '',
                        style: TextStyle(fontSize: 17),
                      ),
                      subtitle: Text(
                        product.gia ?? '',
                        style: TextStyle(fontSize: 17),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetail(id_sp: product.id_sp),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Type to search products'),
    );
  }
}
