import 'package:flutter/material.dart';

class Detialproduct extends StatefulWidget {
  const Detialproduct({super.key});

  @override
  State<Detialproduct> createState() => _DetialproductState();
}

class _DetialproductState extends State<Detialproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      )),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Tên sản phẩm"),
        Text("Đánh giá"),
        Container(
            child: Image.asset(
          'assets/hinh.jpg',
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        )),
        Text("Màu sắc: Tên màu"),
        Text("Kích cỡ : size tương ứng"),
        Text("Lựa chọn size"),
        Text("Số lượng"),
        Text("Gía"),
        // Row(
        //   children: [
        //     ElevatedButton(onPressed: () {}, child: Text("Thêm vào giỏ hàng")),
        //     ElevatedButton(onPressed: () {}, child: Text("Thêm vào giỏ hàng"))
        //   ],
        // )
      ]),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Expanded(
          //   child: MaterialButton(
          //     color: Colors.blueGrey,
          //     onPressed: () {},
          //     child: Container(
          //       alignment: Alignment.center,
          //       height: 70,
          //       child: const Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Icon(Icons.chat),
          //           Padding(
          //             padding: EdgeInsets.only(top: 5.0),
          //             child: Text('Chat'),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                // if (!Account.isUserLoggedIn) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const LoginScreen()));
                //   return;
                // }
                // saveSaler();
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
          Expanded(
            child: MaterialButton(
              color: Colors.lightBlue,
              onPressed: () {
                // if (!Account.isUserLoggedIn) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const LoginScreen(),
                //     ),
                //   );
                // } else {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => OrderPage(product: widget.pro),
                //     ),
                //   );
                // }
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
    );
  }
}
