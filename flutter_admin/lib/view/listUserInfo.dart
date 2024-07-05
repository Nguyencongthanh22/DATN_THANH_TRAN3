import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;

  const ProductCard({
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
              // top: BorderSide(color: Colors.grey),
              // bottom: BorderSide(color: Colors.grey),
              ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productName,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardUserInfo extends StatefulWidget {
  const CardUserInfo({super.key});

  @override
  State<CardUserInfo> createState() => _CardUserInfoState();
}

class _CardUserInfoState extends State<CardUserInfo> {
  final List<ProductCard> products = [
    ProductCard(
      productName: "User 1",
    ),
    ProductCard(
      productName: "User 2",
    ),
    ProductCard(
      productName: "User 3",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
        title: Text('Danh sách người dùng'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return products[index];
        },
      ),
    );
  }
}
