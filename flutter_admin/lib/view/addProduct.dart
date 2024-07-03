import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_admin/Method/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'addProductVariation.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key, this.id_cha});
  final int? id_cha;

  @override
  State<AddProduct> createState() => _AddProductState();
}

late Future<String?> futureEmail;

class _AddProductState extends State<AddProduct> {
  final TextEditingController ten = TextEditingController();
  final TextEditingController mota = TextEditingController();
  final TextEditingController gia = TextEditingController();
  String? email;
  void initState() {
    super.initState();

    futureEmail = getUserEmail();
  }

  Future<String?> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email');
    return email;
  }

  void addproduct() async {
    final data = {
      'ten': ten.text.toString(),
      'mota': mota.text.toString(),
      'gia': double.parse(gia.text.toString()),
      'id_danhmuc': widget.id_cha,
      // 'trangthai': true,
      'id_email': email,
    };

    final result = await API().postRequset(route: '/AddProduct', data: data);
    final response = jsonDecode(result.body);

    if (response['status'] == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddProductVariation(
                    ten_sp: ten.text,
                  )));
    } else {
      print('Error________________: ${response['message']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Thêm sản phẩm',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        // leading: IconButton(
        //     onPressed: () => Navigator.pop(context),
        //     icon: const Icon(
        //       Icons.arrow_back,
        //       color: Colors.red,
        //     )),
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
              controller: ten,
              decoration: InputDecoration(
                  labelText: 'Tên sản phẩm ',
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              controller: mota,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Mô tả sản phẩm",
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
              controller: gia,
              keyboardType: TextInputType.text,
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
            addproduct();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Them",
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
      ])),
    );
  }
}
