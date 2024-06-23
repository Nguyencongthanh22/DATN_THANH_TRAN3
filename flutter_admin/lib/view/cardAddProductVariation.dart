import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CardAddProductVariation extends StatefulWidget {
  final String color;
  final String size;
  final int quantity;
  final File? image;

  CardAddProductVariation({
    required this.color,
    required this.size,
    required this.quantity,
    this.image,
  });

  @override
  State<CardAddProductVariation> createState() =>
      _CardAddProductVariationState();
}

class _CardAddProductVariationState extends State<CardAddProductVariation> {
  File? _imageFile;

  void _pickImage(ImageSource source) async {
    final pickedImageFile = await ImagePicker().getImage(source: source);

    if (pickedImageFile != null) {
      setState(() {
        _imageFile = File(pickedImageFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: _imageFile != null
            ? CircleAvatar(
                backgroundImage: FileImage(_imageFile!),
                radius: 30,
              )
            : IconButton(
                onPressed: () async {
                  var image =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      _imageFile = File(image.path);
                    });
                  }
                },
                icon: Icon(Icons.add)),
        title: Text('Chọn hình ảnh sản phẩm'),
        onTap: () {
          if (_imageFile == null) {
            _showImagePickerDialog();
          }
        },
      ),
    );
  }

  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Chọn hình ảnh'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context);
                var image =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    _imageFile = File(image.path);
                  });
                }
              },
              child: ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Chọn từ thư viện'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context);
                var image =
                    await ImagePicker().getImage(source: ImageSource.camera);
                if (image != null) {
                  setState(() {
                    _imageFile = File(image.path);
                  });
                }
              },
              child: ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Chụp ảnh mới'),
              ),
            ),
          ],
        );
      },
    );
  }
}
