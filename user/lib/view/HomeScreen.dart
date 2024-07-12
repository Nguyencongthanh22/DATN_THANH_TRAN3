import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../methods/api.dart';
import '../models/Category.dart';
import '../models/Coupon.dart';
import '../models/Image.dart';

import '../models/product.dart';
import 'cartScreen.dart';
import 'productDetail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeScreen> {
   late Future<List<Product>> futureProduct;
  late Future<List<Coupon>> FutureCoupon;
  late Future<List<Image2>> futureImage2;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchData2();
    FutureCoupon = getCoupon();
    futureImage2 = GetImage();
  }

  List<Coupon?> Coupons = [];
  List<Product?> products = [];
  bool isLoading = false;
  Dio dio = Dio();
  Future<List<Coupon>> getCoupon() async {
    String api = API().getUrl('/getCoupon');
    final response = await dio.get(api,
        queryParameters: {'trangthai': 1},
        options: Options(
          headers: {'Accept': 'application/json'},
        ));

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      List<Coupon> fetchedProducts =
          data.map((json) => Coupon.fromJson(json)).toList();
      Coupons.addAll(fetchedProducts);
      print('coupon_________${response.data}');
    } else {
      throw Exception('Failed to load user data');
    }
    return Coupons.cast<Coupon>();
  }

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

  List<Image2?> Images = [];
  Future<List<Image2>> GetImage() async {
    String api = API().getUrl('/getImage');
    final response = await dio.get(api,
        options: Options(
          headers: {'Accept': 'application/json'},
        ));

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      List<Image2> fetchedProducts = data.map((json) {
        print(json);
        return Image2.fromJson(json);
      }).toList();
      Images.addAll(fetchedProducts);
      print('hinh_________${response.data}');
    } else {
      throw Exception('Failed to load user data');
    }
    return Images.cast<Image2>();
  }

  final List<String> imagelist = [
    "assets/hinh.jpg",
    "assets/hinh2.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                              delegate: CustomSearchDelegate(searchProducts),
                            );
                          },
                        ),
                        InkWell(
                          child: Text(
                            "Search....?",
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(searchProducts),
                            );
                          },
                        ),
                    ],
                    ),
                    
                  ),
                    Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                    },
                  ),
                ],
              )
                  ]
                  
                 
            ),),
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
                  FutureBuilder<List<Product>>(
                    future: futureProduct,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No products available'));
                      } else {
                        // Use a FutureBuilder for coupons
                        return FutureBuilder<List<Coupon>>(
                          future: FutureCoupon,
                          builder: (context, snapshotCoupon) {
                            if (snapshotCoupon.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshotCoupon.hasError) {
                              return Center(
                                  child:
                                      Text('Error: ${snapshotCoupon.error}'));
                            }

                            // Define a variable to hold coupon data, if available
                            List<Coupon>? coupons = snapshotCoupon.data;

                            // Use another FutureBuilder for product variations/images
                            return FutureBuilder<List<Image2>>(
                              future: futureImage2,
                              builder: (context, snapshotImage) {
                                if (snapshotImage.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshotImage.hasError) {
                                  return Center(
                                      child: Text(
                                          'Error: ${snapshotImage.error}'));
                                } else if (!snapshotImage.hasData ||
                                    snapshotImage.data!.isEmpty) {
                                  return Center(
                                      child: Text('No variations found'));
                                }

                                // Build the GridView using product data and variations/images
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
                                    // Filter images/variations for the current product
                                    List<Image2> productImages = snapshotImage
                                        .data!
                                        .where((img) =>
                                            img.id_sp ==
                                            snapshot.data![index].id_sp)
                                        .toList();

                                    // Calculate prices
                                    double originalPrice = double.parse(
                                        snapshot.data![index].gia ?? '0');
                                    double discountedPrice = originalPrice;

                                    // Check if coupons are available and apply discount if applicable
                                    if (coupons != null && coupons.isNotEmpty) {
                                      // Find the first matching coupon
                                      Coupon? coupon = coupons.firstWhere(
                                        (coupon) =>
                                            coupon.id_danhmuc ==
                                            snapshot.data![index].id_danhmuc,
                                        orElse: () => Coupon(
                                            tenct: '',
                                            id: 0,
                                            mota: '',
                                            trangthai: 0,
                                            id_danhmuc: 0,
                                            ngaytao: '',
                                            phantram:
                                            
                                                0), // Return a default Coupon object or handle the absence differently
                                      );

                                      // Apply discount if coupon is found
                                      if (coupon.id_danhmuc != 0) {
                                        // Assuming id_danhmuc of 0 indicates no coupon found
                                        discountedPrice = originalPrice -
                                            (originalPrice *
                                                (coupon.phantram ?? 0) /
                                                100);
                                      }
                                    }

                                    // Build the product card
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductDetail(
                                              id_sp:snapshot.data![index].id_sp,
                                              gia: double.parse( snapshot.data![index].gia!),
                                              giakm: discountedPrice,
                                              tensp: snapshot.data![index].ten,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 150,
                                              width: 230,
                                              child: productImages.isNotEmpty
                                                  ? PageView.builder(
                                                      itemCount:
                                                          productImages.length,
                                                      itemBuilder:
                                                          (context, imgIndex) {
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                
                                                            image:
                                                                DecorationImage(
                                                              image: 
                                                                  NetworkImage(
                                                                'https://humbly-sacred-mongrel.ngrok-free.app/storage/${productImages[imgIndex].image}',
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    )
                                                  : Placeholder(), // Placeholder or ErrorWidget if image is not available
                                            ),
                                            SizedBox(height: 20),
                                            Text(snapshot.data![index].ten ??
                                                ''), // Product name
                                            Text(
                                                '${originalPrice.toStringAsFixed(2)}'), // Original price
                                            if (discountedPrice !=
                                                originalPrice)
                                              Text(
                                                  '${discountedPrice.toStringAsFixed(2)}'), // Discounted price if applicable
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            )),
    
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
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Type to search products'),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: searchProducts(query), // Sử dụng query để tìm kiếm
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
                var product = snapshot.data![index];
                var imageUrl = product.images.isNotEmpty
                    ? 'https://humbly-sacred-mongrel.ngrok-free.app/storage/${product.images[0].image}' // Lấy hình ảnh đầu tiên của sản phẩm
                    : ''; // Xử lý trường hợp không có hình ảnh

                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetail(id_sp: product.id_sp)));
                    },
                    child: Row(
                      children: [
                        imageUrl.isNotEmpty
                            ? Container(
                                height: 80,
                                width: 80, // Đặt chiều cao của hình ảnh
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl),
                                    fit: BoxFit
                                        .cover, // Chỉnh sửa để hình ảnh vừa với khung
                                  ),
                                ),
                              )
                            : Container(),
                        Column(
                          children: [
                            Text(product.ten ?? ''),
                            Text(
                                'Price: ${product.gia}'), // Nếu không có hình ảnh, có thể hiển thị một widget trống hoặc thích hợp khác
                          ],
                        ),
                        Divider(
                          height: 5,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                );
              });
        }
      },
    );
  }
}
