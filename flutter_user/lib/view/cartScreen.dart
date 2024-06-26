import 'dart:io';

import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity = 0;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Giỏ hàng"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          //const Divider(),
          SizedBox(height: 20),
          Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(246, 238, 238, 1),
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18), bottom: Radius.circular(18))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://vcdn1-dulich.vnecdn.net/2021/07/16/1-1626437591.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=i2M2IgCcw574LT-bXFY92g'),
                                fit: BoxFit.fill),
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(18),
                                bottom: Radius.circular(18))),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "UV",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        Text('Mã sản phẩm: '),
                        Text("Màu sắc: "),
                        Text("Kích cỡ: "),
                        Text(
                          "So luong:",
                          
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //  
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                '',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                            // IconButton(
                            //   icon: Icon(Icons.add),
                            //   onPressed: _incrementQuantity,

                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: () => {}),
                    ),
                  
                  
                ],
              ))
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(246, 238, 238, 1),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tong tien",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                Text("VND", style: TextStyle(color: Colors.black, fontSize: 20))
              ],
            ),
            Container(
              width: 200,
              height: 900,
              color: Colors.red[400],
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Thanh toan",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
            )
          ])),
    );
  }
}
