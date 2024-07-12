import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/view/addProductVariation.dart';
import 'package:flutter_admin/view/editProductVariation.dart';

import '../Method/api.dart';
import '../models/Product.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key, this.id_sp});
  final int? id_sp;
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  TextEditingController tenspcontroller = TextEditingController();
  TextEditingController motacontroller = TextEditingController();
  TextEditingController giacontroller = TextEditingController();
  Dio dio = Dio();
  Products? pros;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Map<String, dynamic> formData = {
        "id_sp": widget.id_sp,
      };
      String api = API().getUrl('/showIdProduct2');
      final response = await dio.get(api,
          data: formData,
          options: Options(
            headers: {
              'Accept': 'application/json',
            },
          ));
      print('Lấy data profile: ${response.data}');
      setState(() {
        pros = Products.fromJson(jsonDecode(jsonEncode(response.data)));
        tenspcontroller.text = pros!.ten ?? '';
        motacontroller.text = pros!.mota ?? '';
        giacontroller.text = '${pros!.gia}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Sửa sản phẩm',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.red,
              )),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Divider(
            color: Colors.grey[400],
            thickness: 1.0,
          ),
          const SizedBox(height: 50),
          const SizedBox(height: 30),
          Form(
              child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
              child: TextFormField(
                controller: tenspcontroller,
                decoration: InputDecoration(
                    labelText: 'Tên sản phẩm',
                    fillColor: Colors.red[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
              child: TextFormField(
                controller: motacontroller,
                decoration: InputDecoration(
                  labelText: "Mô tả",
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
              child: TextFormField(
                controller: giacontroller,
                decoration: InputDecoration(
                    labelText: "Giá",
                    fillColor: Colors.red[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
          ])),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProductVariation(
                    id_sp: widget.id_sp,
                  ),
                ),
              );
              // //           controller.loginUser(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Tiếp theo",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ])));
  }
}
