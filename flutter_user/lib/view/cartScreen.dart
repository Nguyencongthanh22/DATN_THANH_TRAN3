import 'package:flutter/material.dart';
import 'package:flutter_user/view/numberUpDown.dart';
import 'package:flutter_user/view/paymentScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Giỏ hàng',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.red,
              ))),
      body: SingleChildScrollView(
        child: Column(children: [
          //const Divider(),
          //SizedBox(height: 18),
          Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(246, 238, 238, 1),
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18), bottom: Radius.circular(18))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Container(
                            height: 130,
                            width: 130,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://vcdn1-dulich.vnecdn.net/2021/07/16/1-1626437591.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=i2M2IgCcw574LT-bXFY92g'),
                                    fit: BoxFit.fill),
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(18),
                                    bottom: Radius.circular(18))),
                          )),
                      Padding(
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
                            Container(
                              // margin: EdgeInsets.all(15),
                              height: 40,
                              width: 135,
                              child: NumberUpDown(onChanged: (int) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 30,
                        ),
                        onPressed: () => {}),
                  ),
                ],
              ))
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tổng thanh toán:'),
                    Text('100000',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                color: Colors.red[400],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Text(
                    'Đặt ngay',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
