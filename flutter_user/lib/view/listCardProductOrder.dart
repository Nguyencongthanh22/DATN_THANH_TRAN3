import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productColor;
  final String productSize;
  final int productQuantity;

  const ProductCard({
    required this.productName,
    required this.productImage,
    required this.productColor,
    required this.productSize,
    required this.productQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
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
                Row(
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(productImage),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(productColor),
                        Text(productSize),
                        SizedBox(height: 8),
                        Text(
                          "Số lượng: $productQuantity",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListCardProductOrder extends StatelessWidget {
  final List<ProductCard> products = [
    ProductCard(
      productName: "Product 1",
      productImage:
          "https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg",
      productColor: "Red",
      productSize: "M",
      productQuantity: 1,
    ),
    ProductCard(
      productName: "Product 2",
      productImage:
          "https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg",
      productColor: "Blue",
      productSize: "L",
      productQuantity: 2,
    ),
    ProductCard(
      productName: "Product 3",
      productImage:
          "https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg",
      productColor: "Green",
      productSize: "S",
      productQuantity: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return products[index];
      },
    );
  }
}
