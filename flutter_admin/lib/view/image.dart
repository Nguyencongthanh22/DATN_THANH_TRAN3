import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Method/api.dart';
import 'cardAddProduct.dart';

class ImageUploader extends StatefulWidget {
  final int? productId;
  final int? colorId;

  const ImageUploader({Key? key, this.productId, this.colorId})
      : super(key: key);

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  File? _image;
  final picker = ImagePicker();
  Dio dio = Dio();

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    String apiUrl =
        API().getUrl('/uploadImage'); // Replace with your Laravel API endpoint
    String fileName = _image!.path.split('/').last;

    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(_image!.path, filename: fileName),
      'id_sp': widget.productId,
      'id_color': widget.colorId,
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

      if (response.statusCode == 201) {
        // Handle success
        print('Image uploaded successfully');
        // You can handle success message or navigate to another page
      } else {
        // Handle error
        print('Failed to upload image');
      }
    } catch (e) {
      // Handle Dio errors
      print('Dio error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(
                    _image!,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  )
                : Icon(Icons.image, size: 100),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _image == null ? null : _uploadImage,
              child: Text('Upload Image'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCardProduct(id_sp: widget.productId,)));
              },
              child: Text('Hoàn tất'),
            ),
          ],
        ),
      ),
    );
  }
}
