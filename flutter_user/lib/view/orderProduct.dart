import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_user/view/cardDetailOrder.dart';
import 'cardProducRecive.dart';

class OrderProduct extends StatefulWidget {
  const OrderProduct({super.key});

  @override
  State<OrderProduct> createState() => _OrderProductState();
}

class _OrderProductState extends State<OrderProduct> {
  final List<Product> products = [
    Product(
      name: "Product 1",
      image:
          "https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg",
      color: "Red",
      size: "M",
      quantity: 1,
      price: 200000,
    ),
    Product(
      name: "Product 2",
      image:
          "https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg",
      color: "Blue",
      size: "L",
      quantity: 2,
      price: 200000,
    ),
    Product(
      name: "Product 3",
      image:
          "https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg",
      color: "Green",
      size: "S",
      quantity: 3,
      price: 200000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Chi tiết sản phẩm',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.red,
              )),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Chờ giao hàng",
              ),
              Tab(text: "Đã giao"),
              Tab(text: "Đã hủy"),
              Tab(text: "Đã trả hàng"),
            ],
            indicatorColor: Colors.red, // Màu đỏ khi tab được chọn
            labelColor: Colors.red, // Màu chữ khi tab được chọn
            unselectedLabelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: CardDetailOrder(
                    productName: product.name,
                    productImage: product.image,
                    productColor: product.color,
                    productSize: product.size,
                    productQuantity: product.quantity,
                    productPrice: product.price,
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: CardProductRecive(
                    productName: product.name,
                    productImage: product.image,
                    productColor: product.color,
                    productSize: product.size,
                    productQuantity: product.quantity,
                    productPrice: product.price,
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: CardDetailOrder(
                    productName: product.name,
                    productImage: product.image,
                    productColor: product.color,
                    productSize: product.size,
                    productQuantity: product.quantity,
                    productPrice: product.price,
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: CardDetailOrder(
                    productName: product.name,
                    productImage: product.image,
                    productColor: product.color,
                    productSize: product.size,
                    productQuantity: product.quantity,
                    productPrice: product.price,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final String color;
  final String size;
  final int quantity;
  final double price;

  Product(
      {required this.name,
      required this.image,
      required this.color,
      required this.size,
      required this.quantity,
      required this.price});
}
