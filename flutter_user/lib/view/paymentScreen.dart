import 'package:flutter/material.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       "Ten: ",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        " Gia:  ",
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                               
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            "So luong: ",
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                               
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ],
          ),
          ),
      )
    );
  }
}