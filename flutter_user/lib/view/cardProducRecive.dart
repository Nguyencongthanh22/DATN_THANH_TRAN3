import 'package:flutter/material.dart';
import 'package:flutter_user/view/orderProductDetail.dart';

class CardProductRecive extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productColor;
  final String productSize;
  final int productQuantity;
  final double productPrice;

  const CardProductRecive({
    required this.productName,
    required this.productImage,
    required this.productColor,
    required this.productSize,
    required this.productQuantity,
    required this.productPrice,
  });
//const CardProductRefund({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderProductDetail(
                  productName: productName,
                  productColor: productColor,
                  productImage: productImage,
                  productSize: productSize,
                  productQuantity: productQuantity)),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
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
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(productColor),
                          Text(productSize),
                          SizedBox(height: 8),
                          Text(
                            "Số lượng: $productQuantity",
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Tổng tiền: $productPrice",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => AddCardProduct()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            "Đánh giá",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => AddCardProduct()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            "Trả hàng",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
