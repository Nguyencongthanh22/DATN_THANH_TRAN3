import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/view/homeScreen.dart';
import 'package:image_picker/image_picker.dart';
import '../Method/api.dart';
import '../models/ProductVaritation.dart';

class AddCardProduct extends StatefulWidget {
  final int? id_sp;
  const AddCardProduct({Key? key, this.id_sp}) : super(key: key);

  @override
  State<AddCardProduct> createState() => _AddCardProductState();
}

class _AddCardProductState extends State<AddCardProduct> {
  late Future<List<Producvaritation>> futureProduct;
  Dio dio = Dio();
  List<Producvaritation> productVariations = [];

  @override
  void initState() {
    super.initState();
    futureProduct = fetchData();
  }

  File? _image;
  final picker = ImagePicker();
  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<List<Producvaritation>> fetchData() async {
    try {
      String api = API().getUrl('/getProductVaritication');
      final response = await dio.get(
        api,
        queryParameters: {
          'id_sp': widget.id_sp,
          'trangthai': 1,
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

  Future<void> _uploadImage(int colorId) async {
    if (_image == null) return;

    String apiUrl =
        API().getUrl('/uploadImage'); // Replace with your Laravel API endpoint
    String fileName = _image!.path.split('/').last;

    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(_image!.path, filename: fileName),
      'id_sp': widget.id_sp,
      'id_color': colorId,
    });

    try {
      Response response = await dio.post(
        apiUrl,
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        
      }
      
      else if  (response.statusCode == 420) {
        
      } else {
        print(
            'Failed to upload image: ${response.statusCode} ${response.statusMessage}');
      }
    } catch (e) {
      if (e is DioError) {
        print('Dio error: ${e.message}');
        if (e.response != null) {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Màu sản phẩm đã được thêm hình ảnh trước đó')));
          print('Error response: ${e.response}');
        }
      } else {
        print('Unexpected error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Add Product Image',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.red),
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
                      return InkWell(
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: Color.fromARGB(255, 248, 128, 120),
                                width: 1.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              GestureDetector(
                                onTap: _pickImage,
                                
                                child: _image != null
                                    ? Image.file(
                                        _image!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(Icons.image, size: 100),
                              ),
                              SizedBox(height: 10),
                              Text('Color: ${snapshot.data![index].Ten_size}',
                                  style: TextStyle(fontSize: 16)),
                              Text('Size: ${snapshot.data![index].name_color}',
                                  style: TextStyle(fontSize: 16)),
                              Text(
                                  'Quantity: ${snapshot.data![index].so_luong}',
                                  style: TextStyle(fontSize: 16)),
                            ]),
                          ),
                        ),
                        onTap: () {
                          _uploadImage(snapshot.data![index].id_color ?? 0);
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
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
                "Hoàn tất",
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
    );
  }
}
