import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user/models/category.dart';

import '../../methods/api.dart';
import 'categoryConNam.dart';
import 'categoryBB.dart';
import 'categoryTE.dart';
import 'categoryconNu.dart';

class Catelory2 extends StatefulWidget {
  const Catelory2({Key? key}) : super(key: key);

  @override
  State<Catelory2> createState() => _CateloryState();
}

late Future<List<Category>> futureCategory;
late Future<List<Category>> futureCategorynam;
late Future<List<Category>> futureCategorynu;
late Future<List<Category>> futureCategoryTE;
late Future<List<Category>> futureCategoryBB;

class _CateloryState extends State<Catelory2> {
  @override
  void initState() {
    super.initState();
    futureCategory = fetchData();
    futureCategorynam = fetchDataNam();
    futureCategorynu = fetchDataNu();
    futureCategoryTE = fetchDataTE();
    futureCategoryBB = fetchDataBB();
  }

  Dio dio = Dio();
  List<int> categoryIds = [1, 2, 3, 4];
  List<int> categoryid_cha = [0];
  List<int> categorycap = [1];
  List<Category?> categories = []; 
  List<int> categoryIdsNam = [5, 8, 11, 16, 19, 22, 25,28];
  List<int> categoryid_chaNam = [1];
  List<int> categorycapNam = [2];
  List<Category?> categoriesNam = [];
  List<int> categoryIdsNu = [6, 9, 12, 14, 17, 20, 23, 26, 29];
  List<int> categoryid_chaNu = [2];
  List<int> categorycapNu = [2]; 
  List<Category?> categoriesNu = [];
  List<int> categoryIdsTe = [7, 10, 13, 15, 18, 21, 24, 27, 30];
  List<int> categoryid_chaTE = [3];
  List<int> categorycapTE = [2]; 
  List<Category?> categoriesTE = [];
  List<int> categoryIdsBB = [133, 134];
  List<int> categoryid_chaBB = [4];
  List<int> categorycapBB = [2];
  List<Category?> categoriesBB = [];
  bool isLoading = false;
  Future<List<Category>> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Clear existing categories before fetching new ones
      categories.clear();

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
              Category category = Category.fromJson(response.data);
              // Add category only if it's valid
              if (category.id_danhmuc != null) {
                setState(() {
                  categories.add(category);
                  //   print('________________${response.data}');
                });
              } else {
                // Continue to next iteration if category is invalid
                continue;
              }
            } else {
              print('Error fetching data: ${response.statusCode}');
              // Continue to next iteration on error
              continue;
            }
          }
        }
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

    return categories.cast<Category>(); // Return list of Category objects
  }

  Future<List<Category>> fetchDataNam() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Clear existing categories before fetching new ones
      categoriesNam.clear();

      // Gửi yêu cầu GET cho từng id danh mục trong danh sách
      for (int id in categoryIdsNam) {
        for (int id_cha in categoryid_chaNam) {
          for (int cap in categorycapNam) {
            String api = API().getUrl('/Category3');
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
              Category category = Category.fromJson(response.data);

              // Add category only if it's valid
              if (category.id_danhmuc != null) {
                setState(() {
                  categoriesNam.add(category);
                });
              } else {
                // Continue to next iteration if category is invalid
                continue;
              }
            } else {
              print('Error fetching data: ${response.statusCode}');
              // Continue to next iteration on error
              continue;
            }
          }
        }
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

    return categoriesNam.cast<Category>(); // Return list of Category objects
  }

  Future<List<Category>> fetchDataNu() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Clear existing categories before fetching new ones
      categoriesNu.clear();

      // Gửi yêu cầu GET cho từng id danh mục trong danh sách
      for (int id in categoryIdsNu) {
        for (int id_cha in categoryid_chaNu) {
          for (int cap in categorycapNu) {
            String api = API().getUrl('/Category4');
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
              Category category = Category.fromJson(response.data);
              // Add category only if it's valid
              if (category.id_danhmuc != null) {
                setState(() {
                  categoriesNu.add(category);
                });
              } else {
                // Continue to next iteration if category is invalid
                continue;
              }
            } else {
              print('Error fetching data: ${response.statusCode}');
              // Continue to next iteration on error
              continue;
            }
          }
        }
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

    return categoriesNu.cast<Category>(); // Return list of Category objects
  }

  Future<List<Category>> fetchDataTE() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Clear existing categories before fetching new ones
      categoriesTE.clear();

      // Gửi yêu cầu GET cho từng id danh mục trong danh sách
      for (int id in categoryIdsTe) {
        for (int id_cha in categoryid_chaTE) {
          for (int cap in categorycapTE) {
            String api = API().getUrl('/Category5');
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
              Category category = Category.fromJson(response.data);
              // Add category only if it's valid
              if (category.id_danhmuc != null) {
                setState(() {
                  categoriesTE.add(category);
                });
              } else {
                // Continue to next iteration if category is invalid
                continue;
              }
            } else {
              print('Error fetching data: ${response.statusCode}');
              // Continue to next iteration on error
              continue;
            }
          }
        }
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

    return categoriesTE.cast<Category>(); // Return list of Category objects
  }

  Future<List<Category>> fetchDataBB() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Clear existing categories before fetching new ones
      categoriesBB.clear();

      // Gửi yêu cầu GET cho từng id danh mục trong danh sách
      for (int id in categoryIdsBB) {
        for (int id_cha in categoryid_chaBB) {
          for (int cap in categorycapBB) {
            String api = API().getUrl('/Category6');
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
              Category category = Category.fromJson(response.data);
              // Add category only if it's valid
              if (category.id_danhmuc != null) {
                setState(() {
                  categoriesBB.add(category);
                });
              } else {
                // Continue to next iteration if category is invalid
                continue;
              }
            } else {
              print('Error fetching data: ${response.statusCode}');
              // Continue to next iteration on error
              continue;
            }
          }
        }
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

    return categoriesBB.cast<Category>(); // Return list of Category objects
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: categories.length,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
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
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () async {},
                  ),
                ])
              ],
            ),
            bottom: TabBar(
              tabs: [
                for (int i = 0; i < categories.length; i++)
                  Flexible(
                    child: Tab(
                      text: categories.isNotEmpty
                          ? categories[i]?.id_cha == 0 &&
                                  categories[i]?.cap == 1
                              ? categories[i]?.tendanhmuc ?? 'khong'
                              : 'khong'
                          : 'Loading...',
                    ),
                  ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FutureBuilder<List<Category>>(
                future: futureCategorynam,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
                  } else {
                    List<Category> categoryList = snapshot.data ?? [];
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < categoriesNam.length; i++)
                            categoriesNam[i] != null
                                ? InkWell(
                                    child: Container(
                                      height: 70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              categories.isNotEmpty
                                                  ? categoriesNam[i]?.id_cha ==
                                                              1 &&
                                                          categoriesNam[i]
                                                                  ?.cap ==
                                                              2
                                                      ? categoriesNam[i]
                                                              ?.tendanhmuc ??
                                                          'khong'
                                                      : 'khong'
                                                  : 'Loading...',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CategoryBB(
                                                    Id_cha: categoriesNam[i]
                                                        ?.id_danhmuc,
                                                  )));
                                    },
                                  )
                                : Text('No data available for Tab ${i + 1}'),
                        ],
                      ),
                    );
                  }
                },
              ),
              FutureBuilder<List<Category>>(
                future: futureCategorynu,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Đã xảy ra lỗi: ${snapshot.error}'),
                    );
                  } else {
                    List<Category> categoryList = snapshot.data ?? [];
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < categoriesNu.length; i++)
                            categoriesNu[i] != null
                                ? InkWell(
                                    child: Container(
                                      height: 70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              categories.isNotEmpty
                                                  ? categoriesNu[i]?.id_cha ==
                                                              2 &&
                                                          categoriesNu[i]
                                                                  ?.cap ==
                                                              2
                                                      ? categoriesNu[i]
                                                              ?.tendanhmuc ??
                                                          'khong'
                                                      : 'khong'
                                                  : 'Loading...',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CategoryNu(
                                                    Id_cha: categoriesNu[i]
                                                        ?.id_danhmuc,
                                                  )));
                                    },
                                  )
                                : Text('No data available for Tab ${i + 1}'),
                        ],
                      ),
                    );
                  }
                },
              ),
              FutureBuilder<List<Category>>(
                future: futureCategoryTE,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Đã xảy ra lỗi: ${snapshot.error}'),
                    );
                  } else {
                    List<Category> categoryList = snapshot.data ?? [];
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < categoriesTE.length; i++)
                            categoriesTE[i] != null
                                ? InkWell(
                                    child: Container(
                                      height: 70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              categories.isNotEmpty
                                                  ? categoriesTE[i]?.id_cha ==
                                                              3 &&
                                                          categoriesTE[i]
                                                                  ?.cap ==
                                                              2
                                                      ? categoriesTE[i]
                                                              ?.tendanhmuc ??
                                                          'khong'
                                                      : 'khong'
                                                  : 'Loading...',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CategoryTe(
                                                    Id_cha: categoriesTE[i]
                                                        ?.id_danhmuc,
                                                  )));
                                    },
                                  )
                                : Text('No data available for Tab ${i + 1}'),
                        ],
                      ),
                    );
                  }
                },
              ),
              FutureBuilder<List<Category>>(
                future: futureCategoryBB,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Đã xảy ra lỗi: ${snapshot.error}'),
                    );
                  } else {
                    List<Category> categoryList = snapshot.data ?? [];
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < categoriesBB.length; i++)
                            categoriesBB[i] != null
                                ? InkWell(
                                    child: Container(
                                      height: 70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              categories.isNotEmpty
                                                  ? categoriesBB[i]?.id_cha ==
                                                              4 &&
                                                          categoriesBB[i]
                                                                  ?.cap ==
                                                              2
                                                      ? categoriesBB[i]
                                                              ?.tendanhmuc ??
                                                          'khong'
                                                      : 'khong'
                                                  : 'Loading...',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CategoryBB(
                                                    Id_cha: categoriesBB[i]
                                                        ?.id_danhmuc,
                                                  )));
                                    },
                                  )
                                : Text('No data available for Tab ${i + 1}'),
                        ],
                      ),
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
