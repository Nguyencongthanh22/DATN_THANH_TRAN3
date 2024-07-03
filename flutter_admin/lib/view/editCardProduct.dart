import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_admin/view/homeScreen.dart';

class ProductCard extends StatefulWidget {
  final String color;
  final String size;
  int quantity;
  final String? image;
  final VoidCallback onDelete;

  ProductCard({
    required this.color,
    required this.size,
    required this.quantity,
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
                      : widget.image != null
                          ? Image.network(
                              widget.image!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.image, size: 100),
                ),
                SizedBox(height: 10),
                Text('Color: ${widget.color}', style: TextStyle(fontSize: 16)),
                Text('Size: ${widget.size}', style: TextStyle(fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Quantity: ', style: TextStyle(fontSize: 16)),
                    Container(
                      width: 50,
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
          ),
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
  @override
  _EditCardProductState createState() => _EditCardProductState();
}

class _EditCardProductState extends State<EditCardProduct> {
  final List<Map<String, dynamic>> _productsData = [
    {
      'color': 'Trắng',
      'size': 'S',
      'quantity': 10,
      'image':
          'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg',
    },
    {
      'color': 'Đen',
      'size': 'M',
      'quantity': 15,
      'image':
          'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg',
    },
    {
      'color': 'Xanh dương',
      'size': 'L',
      'quantity': 20,
      'image':
          'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg',
    },
  ];

  void _deleteProduct(int index) {
    setState(() {
      _productsData.removeAt(index);
    });
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
            child: ListView.builder(
              itemCount: _productsData.length,
              itemBuilder: (context, index) {
                final product = _productsData[index];
                return ProductCard(
                  color: product['color'],
                  size: product['size'],
                  quantity: product['quantity'],
                  image: product['image'],
                  onDelete: () => _deleteProduct(index),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
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
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
