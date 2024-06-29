import 'dart:io';

import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  final String color;
  final String size;
  final int quantity;
  final File? image;

  demo({
    required this.color,
    required this.size,
    required this.quantity,
    this.image,
  });

  @override
  _CardAddProductVariationState createState() => _CardAddProductVariationState();
}

class _CardAddProductVariationState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          if (widget.image != null)
            Image.file(
              widget.image!,
              height: 100,
              width: 100,
            )
          else
            Icon(Icons.image, size: 100),
          Text('Color: ${widget.color}'),
          Text('Size: ${widget.size}'),
          Text('Quantity: ${widget.quantity}'),
        ],
      ),
    );
  }
}

class AddProductVariation extends StatefulWidget {
  const AddProductVariation({Key? key}) : super(key: key);

  @override
  _AddProductVariationState createState() => _AddProductVariationState();
}

class _AddProductVariationState extends State<AddProductVariation> {
  List<demo> productVariations = [
    demo(
      color: 'Trắng',
      size: 'S',
      quantity: 10,
      image: null, // Replace with a File if you have an image
    ),
    demo(
      color: 'Đen',
      size: 'M',
      quantity: 15,
      image: null,
    ),
    demo(
      color: 'Xanh dương',
      size: 'L',
      quantity: 20,
      image: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm biến thể sản phẩm'),
      ),
      body: ListView.builder(
        itemCount: productVariations.length,
        itemBuilder: (context, index) {
          return productVariations[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add a new product variation
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddProductVariation(),
  ));
}
