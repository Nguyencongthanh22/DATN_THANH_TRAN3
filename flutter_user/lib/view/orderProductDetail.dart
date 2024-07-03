import 'package:flutter/material.dart';
import 'package:flutter_user/view/listCardProductOrder.dart';
// Đảm bảo đúng đường dẫn

class OrderProductDetail extends StatefulWidget {
  const OrderProductDetail({super.key, required String productName, required String productColor, required String productImage, required String productSize, required int productQuantity});

  @override
  State<OrderProductDetail> createState() => _OrderProductDetailState();
}

class _OrderProductDetailState extends State<OrderProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
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
            // SizedBox(height: 20),
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
                    'Thành tiền: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '300000',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Mã đơn hàng',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '1223',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Thời gian đặt hàng',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '12/1/1',
                style: TextStyle(fontSize: 15),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Thời gian nhận hàng',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '12/1/1',
                style: TextStyle(fontSize: 15),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
