import 'package:flutter/material.dart';

class CardProcduct extends StatefulWidget {
  const CardProcduct({super.key});

  @override
  State<CardProcduct> createState() => _CardProcductState();
}

class _CardProcductState extends State<CardProcduct> {
  final List<Product> products = [
    Product(
        name: 'Product 1',
        imageUrl:
            'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg',
        price: 223.000,
        rate: 5),
    Product(
        name: 'Product 2',
        imageUrl:
            'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg',
        price: 223.000,
        rate: 5),
    Product(
        name: 'Product 3',
        imageUrl:
            'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg',
        price: 223.000,
        rate: 5),
    Product(
        name: 'Product 4',
        imageUrl:
            'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg',
        price: 223.000,
        rate: 5),
    Product(
        name: 'Product 5',
        imageUrl:
            'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg',
        price: 223.000,
        rate: 5),
    Product(
        name: 'Product 6',
        imageUrl:
            'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg',
        price: 223.000,
        rate: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length ~/ 2 + (products.length % 2 == 0 ? 0 : 1),
        itemBuilder: (context, index) {
          int firstIndex = index * 2;
          int secondIndex = firstIndex + 1;
          return Row(
            children: [
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(products[firstIndex].imageUrl),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[firstIndex].name,
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  '${products[firstIndex].price} VND',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${products[firstIndex].rate}/5',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )),
                      ]),
                ),
              ),
              if (secondIndex < products.length)
                Expanded(
                    child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(products[firstIndex].imageUrl),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[firstIndex].name,
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  '${products[firstIndex].price} VND',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${products[firstIndex].rate}/5',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )),
                      ]),
                ))
            ],
          );
        });
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price;
  final int rate;

  Product(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.rate});
}
