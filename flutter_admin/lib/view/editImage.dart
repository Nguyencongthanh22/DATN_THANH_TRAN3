import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/models/Image.dart';
import 'package:image_picker/image_picker.dart';
import '../Method/api.dart';
import '../models/ProductVaritation.dart';
import 'homeScreen.dart';

class EditImage extends StatefulWidget {
  final int? id_sp;
  const EditImage({Key? key, this.id_sp}) : super(key: key);

  @override
  State<EditImage> createState() => _AddCardProductState();
}

class _AddCardProductState extends State<EditImage> {
  late Future<List<Image2>> futureProduct;
  Dio dio = Dio();
  List<Image2> productVariations = [];
  List<File?> selectedImages =
      []; // List to store selected images for each card

  @override
  void initState() {
    super.initState();
    futureProduct = fetchData();
  }

  Future<void> _pickImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImages[index] =
            File(pickedFile.path); // Update selected image for specific index
      });
    }
  }

  Future<List<Image2>> fetchData() async {
    try {
      String api = API().getUrl('/getImageId_sp');
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
          Image2 productVariationItem = Image2.fromJson(item);
          productVariations.add(productVariationItem);
          selectedImages.add(
              null); // Initialize selected image list with null for each card
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

  Future<void> _uploadImage(int id, int index) async {
    File? _image = selectedImages[index];
    if (_image == null) return;

    String apiUrl = API().getUrl('/updateImge');
    String fileName = _image.path.split('/').last;

    try {
      final response = await Dio().put(apiUrl, data: {
        'image': await MultipartFile.fromFile(_image.path, filename: fileName),
        'id': id,
      });

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else if (response.statusCode == 420) {
        // Handle specific status code if needed
      } else {
        print(
            'Failed to upload image: ${response.statusCode} ${response.statusMessage}');
      }
    } catch (e) {
      if (e is DioError) {
        print('Dio error: ${e.message}');
        if (e.response != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Màu sản phẩm đã được thêm hình ảnh trước đó'),
            ),
          );
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
            child: FutureBuilder<List<Image2>>(
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
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // GestureDetector(
                                //   onTap: () => _pickImage(index),
                                //   child: selectedImages[index] != null
                                //       ? Image.file(
                                //           selectedImages[index]!,
                                //           height: 100,
                                //           width: 100,
                                //           fit: BoxFit.cover,
                                //         )
                                //       : Icon(Icons.image, size: 100),
                                // ),
                                // SizedBox(height: 10),
                                InkWell(
                                  onTap: () => _pickImage(index),
                                  child: Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://buffalo-quality-ferret.ngrok-free.app/storage/${snapshot.data![index].image}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                                // Text(
                                //   'Kích thước: ${snapshot.data![index].Ten_size}',
                                //   style: TextStyle(fontSize: 16),
                                // ),
                                // Text(
                                //   'Số lượng: ${snapshot.data![index].so_luong}',
                                //   style: TextStyle(fontSize: 16),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          _uploadImage(snapshot.data![index].id ?? 0, index);
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
