import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Method/api.dart';
import '../models/UserClient.dart';

class DetailUserInfo extends StatefulWidget {
  const DetailUserInfo({Key? key, this.email}) : super(key: key);
  final String? email;
  @override
  State<DetailUserInfo> createState() => _DetailStaffInfoState();
}

class _DetailStaffInfoState extends State<DetailUserInfo> {
  bool isChecked = false;
  void initState() {
    super.initState();
    dataAdmin = getUser();
  }

  List<UserClient> user = [];
  Dio dio = Dio();
  late Future<UserClient> dataAdmin;
  Future<UserClient> getUser() async {
    String api = API().getUrl('/getProfileUserEmail');
    final response = await dio.get(api,
        queryParameters: {'email': widget.email},
        options: Options(
          headers: {'Accept': 'application/json'},
        ));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return UserClient.fromJson(data);
    } else {
      throw Exception('Failed to load user data');
    }
  }

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
        body: FutureBuilder<UserClient>(
            future: dataAdmin,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return Text('No products available');
              } else {
                UserClient user2 = snapshot.data!;
                return SingleChildScrollView(
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
                            'Email: ${user2.email}',
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
                            'Ten: ${user2.name}',
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
                            'So dien thoai: ${user2.sodienthoai}',
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
                            'Dia chi: ${user2.diachi} ',
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
                            'Gioi tinh ${user2.gioitinh}',
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
                            'Ngay sinh ${user2.ngaysinh}',
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
                );
              }
            }));
  }
}
