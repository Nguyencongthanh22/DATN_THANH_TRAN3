import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
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
            )),
      
                  bottom: TabBar(tabs: [
                    Tab(
                      text: "Chờ giao hàng",
                    ),
                    Tab(
                      text: "Đã giao",
                    ),
                    Tab(
                      text: "Đã hủy",
                    ),
                    Tab(
                      text: "Đã trả hàng",
                    ),
                    
                  ]),
                  
                ),
      body:TabBarView(children: [
        
      ]),
    );
  
  }
}