import 'package:flutter/material.dart';

class DetailStaffInfo extends StatefulWidget {
  const DetailStaffInfo({super.key});

  @override
  State<DetailStaffInfo> createState() => _DetailStaffInfoState();
}

class _DetailStaffInfoState extends State<DetailStaffInfo> {
  bool isChecked = false;
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
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                          'Tên nhan vien',
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
                          'dia chi',
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
                          'gioi tinh',
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
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.red),
                          ),
                        ),
                        child: Text(
                          'Ngay vao lam',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                     
                    ]))));
  }
}
