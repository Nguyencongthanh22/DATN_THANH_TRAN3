import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final List<String> itemsColor = ['Vàng', 'Hồng', 'Đen', 'Trắng'];
  final List<String> itemsSize = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tên sản phẩm",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Đánh giá", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Container(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                'assets/hinh.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text("Màu sắc:", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: itemsColor.map((color) {
                return ElevatedButton(
                  onPressed: () {
                    // Xử lý khi chọn màu
                  },
                  child: Text(color),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text("Kích cỡ: size tương ứng", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Lựa chọn size", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Số lượng", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Giá", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  // Xử lý khi nhấn vào Thêm giỏ hàng
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_basket),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text('Thêm giỏ hàng'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 16), // Khoảng cách giữa hai button
            Expanded(
              child: MaterialButton(
                color: Colors.lightBlue,
                onPressed: () {
                  // Xử lý khi nhấn vào Mua ngay
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Text('Mua ngay'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
