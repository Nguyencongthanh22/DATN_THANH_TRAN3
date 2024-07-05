import 'package:flutter/material.dart';

class DetailUserInfo extends StatelessWidget {
  const DetailUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
        title: const Text('Thông tin khách hàng'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          //padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.red),
                  ),
                ),
                child: Text(
                  'Tên người dùng',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.red),
                  ),
                ),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.red),
                  ),
                ),
                child: Text(
                  'So dien thoai',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.red),
                  ),
                ),
                child: Text(
                  'Dia chi',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.red),
                  ),
                ),
                child: Text(
                  'Gioi tinh',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.red),
                  ),
                ),
                child: Text(
                  'Ngay sinh',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
