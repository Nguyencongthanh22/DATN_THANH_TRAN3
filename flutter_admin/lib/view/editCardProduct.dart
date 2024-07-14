import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_admin/view/homeScreen.dart';

import '../Method/api.dart';
import '../models/ProductVaritation.dart';
import 'editImage.dart';

class ProductCard extends StatefulWidget {
  final String? color;
  final String? size;
  int? quantity;
  final String? image;
  final int? trangthai;
  final VoidCallback onDelete;

  ProductCard({
    required this.color,
    required this.size,
    required this.quantity,
    required this.trangthai,
    this.image,
    required this.onDelete,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  File? _image;
  late TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _quantityController =
        TextEditingController(text: widget.quantity.toString());
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bạn có chắc chắn muốn xóa',
              style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red[400],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Hủy',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                SizedBox(width: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red[400],
                  ),
                  onPressed: () {
                    widget.onDelete();
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Text('Xóa',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
                color: Color.fromARGB(255, 248, 128, 120), width: 1.0),
          ),
          child: widget.trangthai == 1
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // GestureDetector(
                      //   onTap: _pickImage,
                      //   child: _image != null
                      //       ? Image.file(
                      //           _image!,
                      //           height: 100,
                      //           width: 100,
                      //           fit: BoxFit.cover,
                      //         )
                      //       : widget.image != null
                      //           ? Image.network(
                      //               widget.image!,
                      //               height: 100,
                      //               width: 100,
                      //               fit: BoxFit.cover,
                      //             )
                      //           : Icon(Icons.image, size: 100),
                      // ),
                      SizedBox(height: 10),
                      Text('Color: ${widget.color}',
                          style: TextStyle(fontSize: 16)),
                      Text('Size: ${widget.size}', style: TextStyle(fontSize: 16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Số lượng: ', style: TextStyle(fontSize: 16)),
                          Container(
                            width: 80,
                            child: TextField(
                              controller: _quantityController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  widget.quantity = int.parse(value);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : SizedBox(height: 1),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            icon: Icon(Icons.close_sharp, color: Colors.red),
            onPressed: _showDeleteDialog,
          ),
        ),
      ],
    );
  }
}

class EditCardProduct extends StatefulWidget {
  final int? id_sp;

  const EditCardProduct({Key? key, this.id_sp}) : super(key: key);

  @override
  _EditCardProductState createState() => _EditCardProductState();
}

class _EditCardProductState extends State<EditCardProduct> {
  late Future<List<Producvaritation>> futureProduct;
  Dio dio = Dio();
  List<Producvaritation> productVariations = [];
  List<int> id_bienthe = [];

  @override
  void initState() {
    super.initState();
    futureProduct = fetchData();
  }

  Future<void> updateProfile(int id) async {
    String api = API().getUrl('/updateVari');
    try {
      final response = await Dio().put(
        api,
        data: {
          'id': id,
          'trangthai': 0,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          productVariations.removeWhere((item) => item.id == id);
        });
        print('Profile updated successfully');
      } else {
        print('Failed to update profile: ${response.data}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<List<Producvaritation>> fetchData() async {
    try {
      String api = API().getUrl('/getProductVaritication');
      final response = await dio.get(
        api,
        queryParameters: {
          'id_sp': widget.id_sp,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        for (var item in data) {
          Producvaritation productVariationItem =
              Producvaritation.fromJson(item);
          productVariations.add(productVariationItem);
          id_bienthe.add(productVariationItem.id ?? 0);
        }
      } else {
        print('Error fetching data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    print('Product Variations: ${productVariations}');
    return productVariations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Thêm ảnh sản phẩm',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Producvaritation>>(
              future: futureProduct,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        trangthai: snapshot.data![index].trangthai,
                        color: snapshot.data![index].name_color,
                        size: snapshot.data![index].Ten_size,
                        quantity: snapshot.data![index].so_luong,
                        onDelete: () =>
                            updateProfile(snapshot.data![index].id ?? 0),
                      );
                    },
                  );
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditImage(id_sp: widget.id_sp,)));
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
                "Hoàn tất",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
