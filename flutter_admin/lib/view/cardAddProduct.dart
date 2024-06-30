import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductCard extends StatefulWidget {
  final String color;
  final String size;
  final int quantity;

  ProductCard({
    required this.color,
    required this.size,
    required this.quantity,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  File? _image;

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
            Text('Color: ${widget.color}', style: TextStyle(fontSize: 16)),
            Text('Size: ${widget.size}', style: TextStyle(fontSize: 16)),
            Text('Quantity: ${widget.quantity}',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class AddCardProduct extends StatelessWidget {
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
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ProductCard(
                  color: 'Trắng',
                  size: 'S',
                  quantity: 10,
                ),
                ProductCard(
                  color: 'Đen',
                  size: 'M',
                  quantity: 15,
                ),
                ProductCard(
                  color: 'Xanh dương',
                  size: 'L',
                  quantity: 20,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCardProduct()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Hoàn tất",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
