

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user/models/category.dart';
import 'package:flutter_user/models/product.dart';

import '../../methods/api.dart';
import '../productDetail.dart';
class CategoryNu extends StatefulWidget {
  const CategoryNu({super.key, required this.Id_cha});
  final int? Id_cha;

  @override
  State<CategoryNu> createState() => _CategoryNamState();
}

late Future<List<Product>> futureCategorynam;

class _CategoryNamState extends State<CategoryNu> {
  List<Category> categoryNam = [];
  List<Product> Listproduct = [];
  List<int> ListIddm = [];
  bool isLoading = false;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchData();
    futureCategorynam = fetchProduct();
  }

  Future<List<Product>> fetchProduct() async {
    setState(() {
      isLoading = true;
    });

    try {
      String api = API().getUrl('/Categorydm'); // Construct API endpoint URL
      final response = await dio.get(
        api,
        queryParameters: {'id_cha': widget.Id_cha},
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        ListIddm = (response.data as List)
            .map((item) => int.parse(item.toString()))
            .toList();

        for (int id_danhmuc in ListIddm) {
          String api = API().getUrl('/getProductDetails');
          final productResponse = await dio.get(
            api,
            queryParameters: {
              'id_danhmuc': id_danhmuc,
            },
            options: Options(
              headers: {
                'Accept': 'application/json',
              },
            ),
          );

          if (productResponse.statusCode == 200) {
            List<Product> products = (productResponse.data as List)
                .map((item) => Product.fromJson(item))
                .toList();
            setState(() {
              Listproduct.addAll(products);
            });
          } else {
            print('Error fetching products: ${productResponse.statusCode}');
          }
        }
      } else {
        print('Failed to load id_danhmuc: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching id_danhmuc: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }

    return Listproduct;
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      String api = API().getUrl('/CategoryNam');
      final response = await dio.get(
        api,
        queryParameters: {'id_cha': widget.Id_cha},
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<Category> categories = (response.data as List)
            .map((item) => Category.fromJson(item))
            .toList();
        setState(() {
          categoryNam = categories;
        });
      } else {
        print('Error fetching data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryNam.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category Nam'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (int i = 0; i < categoryNam.length; i++)
                Container(
                  width: 100,
                  child: Tab(text: '${categoryNam[i].tendanhmuc}'),
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (int i = 0; i < categoryNam.length; i++)
              FutureBuilder(
                future: futureCategorynam,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
                  } else {
                    List<Product> filteredProducts = Listproduct.where(
                            (product) =>
                                product.id_danhmuc == categoryNam[i].id_danhmuc)
                        .toList();

                    if (filteredProducts.isEmpty) {
                      return Center(
                          child:
                              Text('Không có sản phẩm nào cho danh mục này'));
                    }

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
                                        builder: (context) => ProductDetail(
                                            id_sp: product.id_sp)));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 230,
                                    child: imageUrl.isNotEmpty
                                        ? PageView.builder(
                                            itemCount: imageUrl.length,
                                            itemBuilder: (context, imgIndex) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      'https://humbly-sacred-mongrel.ngrok-free.app/storage/${product.images[0].image}',
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
                                  Text('${product.gia}'), // Original price
                                  // if (discountedPrice !=
                                  //     originalPrice)
                                  //   Text(
                                  //       '${discountedPrice.toStringAsFixed(2)}'), // Discounted price if applicable
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
