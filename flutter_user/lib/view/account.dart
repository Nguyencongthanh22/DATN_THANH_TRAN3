import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("TÀI KHOẢN"),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_sharp))
        ],
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/hinh.jpg'),
                radius: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tên khách hàng",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "chỉnh sửa tài khoản",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text("Đơn hàng của tôi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.wallet_outlined)),
                        Text("Chờ xác nhận",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.work_history_outlined)),
                        Text("Đang xử lý",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.departure_board_rounded)),
                        Text("Đang giao",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_task_outlined)),
                        Text("Đã giao",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.cached_sharp)),
                        Text("Trả hàng",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                //color: Colors.blue, // Màu nền của Container
                border: Border(
                  top: BorderSide(
                    color: Colors.black, // Màu của gạch dưới
                    width: 0.7,

                    // Độ dày của gạch dưới
                  ),
                  bottom: BorderSide(
                    color: Colors.black, // Màu của gạch dưới
                    width: 0.7,

                    // Độ dày của gạch dưới
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
