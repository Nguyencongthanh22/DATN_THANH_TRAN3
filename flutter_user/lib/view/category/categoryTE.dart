import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../methods/api.dart';
import '../../models/category.dart';

class CategoryTe extends StatefulWidget {
  const CategoryTe({super.key, required this.Id_cha});
  final int? Id_cha;
  @override
  State<CategoryTe> createState() => _CategoryTeState();
}

class _CategoryTeState extends State<CategoryTe> {
  List<Category> categoryNam = [];
  bool isLoading = false;
  Dio dio = Dio();
  @override
  void initState() {
    super.initState();
    fetchData();
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
      print('_________________ + ${widget.Id_cha}');
      print('________________${response.data}');
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
      length: categoryNam
          .length, // Số lượng tab sẽ bằng số lượng danh mục đã nhận được
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category Nam'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (int i = 0; i < categoryNam.length; i++)
                Container(
                    width: 100,
                    child: Tab(text: '${categoryNam[i].tendanhmuc}')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (int i = 0; i < categoryNam.length; i++)
              Center(
                  child: Text(
                      'Content for Tab ${i + 1}: ${categoryNam[i].tendanhmuc}')), // Thay tên biến phù hợp với đối tượng Category
          ],
        ),
      ),
    );
  }
}
