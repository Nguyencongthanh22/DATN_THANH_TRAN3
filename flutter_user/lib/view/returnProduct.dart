import 'package:flutter/material.dart';

class ReturnProduct extends StatefulWidget {
  const ReturnProduct({super.key});

  @override
  State<ReturnProduct> createState() => _ReturnProductState();
}

class _ReturnProductState extends State<ReturnProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Hoàn trả sản phẩm',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
      ),
      body: Form(
            child: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Lý do hoàn trả",
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
         
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Tên người gửi",
                fillColor: Colors.red[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                
                 
                ),
              ),
            ),
            Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
         
            ),
          ),
           Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Địa chỉ lấy hàng",
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
         
            ),
          ),
           
            ]
            )
            )
    );
  }
}             