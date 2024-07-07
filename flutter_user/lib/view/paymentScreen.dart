import 'package:flutter/material.dart';
import 'package:flutter_user/view/listCardProductOrder.dart';
import 'package:flutter_user/view/homescreen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text("Đặt Hàng"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Địa chỉ nhận hàng',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Tên khách hàng',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'sdt',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Địa chỉ',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 500, // Đặt chiều cao cho ListView để có thể cuộn
              child:
                  ListCardProductOrder(), // Gọi ListCardProductOrder trong Column
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Tổng số tiền: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '300000',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Chi tiết thanh toán',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Tổng tiền hàng',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '1223',
                style: TextStyle(
                  fontSize: 15,
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Tổng tiền phí vận chuyển',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '2323',
                style: TextStyle(fontSize: 15),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Tổng thanh toán',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '12322',
                style: TextStyle(fontSize: 18, color: Colors.red[400]),
              )
            ]),
          ],
        ),
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
                      MaterialPageRoute(builder: (context) => Homescreen()));
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
