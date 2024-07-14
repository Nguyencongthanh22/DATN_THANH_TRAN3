import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/models/Product.dart';
import 'package:flutter_admin/view/cardAddProduct.dart';
import 'package:flutter_admin/view/editCardProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Method/api.dart';
import 'addProduct.dart';
import 'package:flutter_admin/models/Size.dart';

class EditProductVariation extends StatefulWidget {
  const EditProductVariation({
    Key? key,
    this.id_sp,
  });
  final int? id_sp;
  @override
  State<EditProductVariation> createState() => _AddProductState();
}

late Future<void> futureProduct;
late Future<void> futureProduct2;

class _AddProductState extends State<EditProductVariation> {
  void initState() {
    super.initState();
    futureProduct = fetchData();
  }

  bool isLoading = false;
  Dio dio = Dio();
  int? idproduct;
  List<Color> id_mau = [];
  List<Size> id_size2 = [];
  TextEditingController soluong = TextEditingController();

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      String api = API().getUrl('/getProduct2'); // Construct API endpoint URL
      final response = await dio.get(
        api,
        queryParameters: {'id_sp': widget.id_sp},
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );    
      print('Response data: ${response.data}');

      idproduct = response.data;
    } catch (e) {
      print('Error fetching: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  String dropdownValueColor = '1';
  String dropdownValueSize = '1';
  String nameColor = 'Trắng';
  String nameSize = 'S';
  Map<String, String> colorValueMap = {
    '1': 'Trắng',
    '2': 'Đen',
    '3': 'Xanh dương',
    '4': 'Xanh lá',
    '5': 'Đỏ',
    '6': 'Vàng',
  };

  Map<String, String> sizeValueMap = {
    '1': 'S',
    '2': 'M',
    '3': 'L',
    '4': 'XL',
    '5': 'XXL',
  };

  void addProduct() async {
    if (nameSize.isEmpty || nameColor.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng chọn tên size và màu sắc')),
      );
      return;
    }

    final data = {
      'id_sp': idproduct,
      'id_size': int.parse(dropdownValueSize),
      'Ten_size': nameSize,
      'id_color': int.parse(dropdownValueColor),
      'name_color': nameColor,
      'soluong': int.parse(soluong.text),
    };

    try {
      final result =
          await API().postRequset(route: '/AddVaritation', data: data);
      final response = jsonDecode(result.body);

      print('Response: $response');

      if (response['status'] == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Thêm thành công')),
        );
        setState(() {
          soluong.clear();
          dropdownValueColor = '1';
          dropdownValueSize = '1';
          futureProduct = fetchData();
        });
      } else if (response['status'] == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bạn đã thêm sản phẩm này trước đó')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          
          SnackBar(content: Text('Thêm thất bại')),
        );
      }
    } catch (e) {
      print('Lỗi khi gọi API: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Thêm sản phẩm',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: Colors.grey[400],
              thickness: 1.0,
            ),
            const SizedBox(height: 70),
            Form(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValueColor,
                      icon: const Icon(Icons.arrow_drop_down),
                      style: const TextStyle(color: Colors.black, fontSize: 17),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueColor = newValue!;
                          nameColor = colorValueMap[newValue]!;
                        });
                      },
                      items: colorValueMap.keys.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(colorValueMap[value]!),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValueSize,
                      icon: const Icon(Icons.arrow_drop_down),
                      style: const TextStyle(color: Colors.black, fontSize: 17),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueSize = newValue!;
                          nameSize = sizeValueMap[newValue]!;
                        });
                      },
                      items: sizeValueMap.keys.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(sizeValueMap[value]!),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: TextFormField(
                      controller: soluong,
                      decoration: InputDecoration(
                        labelText: "Số lượng",
                        fillColor: Colors.red[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addProduct,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Thêm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCardProduct(id_sp: idproduct,),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Tiếp tục",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
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
