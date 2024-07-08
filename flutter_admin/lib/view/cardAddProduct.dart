import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Method/api.dart';
import '../models/ProductVaritation.dart';
import 'image.dart';

class ProductCard extends StatefulWidget {
  final String? color;
  final String? size;
  final int? quantity; // Thêm callback để truyền ảnh đã chọn

  ProductCard({
    required this.color,
    required this.size,
    required this.quantity,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // File? _image;

  // Future<void> _pickImage() async {
  //   final chosenFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (chosenFile != null) {
  //     setState(() {
  //       _image = File(chosenFile.path);
  //     });
  //     widget.onImageSelected(_image!); // Truyền ảnh đã chọn ra ngoài
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Color.fromARGB(255, 248, 128, 120), width: 1.0),
      ),
      child: Padding(
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
            //       : Icon(Icons.image, size: 100),
            // ),
            SizedBox(height: 10),
            Text('Color: ${widget.color}', style: TextStyle(fontSize: 16)),
            Text('Size: ${widget.size}', style: TextStyle(fontSize: 16)),
            Text('Quantity: ${widget.quantity}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

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
          Producvaritation productVariationItem = Producvaritation.fromJson(item);
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

  Future<void> uploadImage(File image, int? id_colors) async {
    try {
      String apiUrl = API().getUrl('/uploadImage');
      String fileName = image.path.split('/').last;

      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path, filename: fileName),
        'id_sp': widget.id_sp,
        'id_color': id_colors,
      });

      final response = await dio.post(apiUrl, data: formData);

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Failed to upload image. Server responded with status code: ${response.statusCode}');
        print('Response body: ${response.data}');
      }
    } catch (e) {
      print('Error uploading image: $e');
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
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageUploader(productId:widget.id_sp ,colorId: snapshot.data![index].id_color,)));},
                        child: ProductCard(
                          color: snapshot.data![index].Ten_size,
                          size: snapshot.data![index].name_color,
                          quantity: snapshot.data![index].so_luong,
                         
                        ),
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
                  builder: (context) => AddCardProduct(id_sp: widget.id_sp),
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
