import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_admin/view/homeScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Method/api.dart';
import '../models/user.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.token, required this.email});
  final String token;
  final String email;

  @override
  State<Profile> createState() => _ProfileState();
}

List<String> _suggestions = [];
late Future<int?> futureQuyen;
late Future<void> update;

class _ProfileState extends State<Profile> {
  TextEditingController _nameController = TextEditingController();
  //TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String? Gender;
  int? Quyen1;
  String test = '';
  User? user;
  Dio dio = Dio();

  String dropdownValueNam = '1';
  String namegender = 'Nam';
  Map<String, String> GenderValueMap = {
    '1': 'Nam',
    '2': 'Nữ',
    '3': 'Khác',
  };

  String dropdownValueQuyen = '0';
  @override
  void initState() {
    super.initState();
    //  service = AuthService();
    futureQuyen = getUserQuyen();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Map<String, dynamic> formData = {
        "email": widget.email,
      };
      String api = API().getUrl('/profileAdmin');
      final response = await dio.get(api,
          data: formData,
          options: Options(
            headers: {
              'Accept': 'application/json',
            },
          ));
      print('Lấy data profile: ${response.data}');
      setState(() {
        user = User.fromJson(jsonDecode(jsonEncode(response.data)));
        _nameController.text = user!.name ?? '';
        //  _emailController.text = user!.email ?? '';
        _addressController.text = user!.diachi ?? '';
        _phoneController.text = user!.sodienthoai ?? '';
        Gender = user!.gioitinh ?? '';
        Quyen1 = user!.quyen;
      });
    });
  }

  int? quyen;
  Future<int?> getUserQuyen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    quyen = preferences.getInt('quyen');
    print('_____________________________${quyen}');
    return quyen;
  }

  @override
  Widget build(BuildContext context) {
    Future<void> updateProfile() async {
      String api = API().getUrl('/updateProfile');
      try {
        final response = await Dio().put(
          api,
          data: {
            'email': widget.email,
            'name': _nameController.text,
            'diachi': _addressController.text,
            'sodienthoai': _phoneController.text,
            'gioitinh': namegender,
          },
          options: Options(
            headers: {
              'Accept': 'application/json',
            },
          ),
        );

        if (response.statusCode == 200) {
          print('Profile updated successfully');
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => HomeScreen())));
        } else {
          print('Failed to update profile: ${response.data}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hồ sơ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'TÀI KHOẢN: ' + widget.email,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "QUYỀN: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        '${quyen == 1 ? 'Quản lý' : 'Nhân viên'}',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "TÊN",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: _nameController,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "Vui lòng nhập tên của bạn",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: const TextStyle(color: Colors.black45),
                        fillColor: Colors.grey[100],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "SỐ ĐIỆN THOẠI",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: _phoneController,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "Vui lòng nhập số điện thoại của bạn",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: const TextStyle(color: Colors.black45),
                        fillColor: Colors.grey[100],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ĐỊA CHỈ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: _addressController,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "Vui lòng nhập địa chỉ của bạn",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: const TextStyle(color: Colors.black45),
                        fillColor: Colors.grey[100],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "GIỚI TÍNH: ${Gender}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValueNam,
                      icon: const Icon(Icons.arrow_drop_down),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueNam = newValue!;
                          namegender = GenderValueMap[newValue]!;
                        });
                      },
                      items: GenderValueMap.keys.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(GenderValueMap[value]!),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                        onPressed: () async {
                          await updateProfile();
                        },
                        child: Text(
                          "LƯU",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          minimumSize: Size(150, 70),
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Loại bỏ góc bo tròn
                          ),
                        ))
                  ])
                ])));
  }
}
