import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_user/methods/api.dart';
import 'package:flutter_user/models/user.dart';
import 'package:flutter_user/view/account.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.token, required this.email});
  final String token;
  final String email;

  @override
  State<Profile> createState() => _ProfileState();
}

List<String> _suggestions = [];

class _ProfileState extends State<Profile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String? Gender;
  String test = '';
  User? user;
  Dio dio = Dio();

  String dropdownValueNam = '1';
  String namegender = ' Nam';
  Map<String, String> GenderValueMap = {
    '1': ' Nam',
    '2': ' Nữ',
    '3': ' Khác',
  };

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Map<String, dynamic> formData = {
        "email": widget.email,
        //"password": "1234567",
      };
      String api = API().getUrl('/profile');
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
        _emailController.text = user!.email ?? '';
        _addressController.text = user!.diachi ?? '';
        _phoneController.text = user!.sodienthoai ?? '';
        Gender = user!.gioitinh ?? '';
        //  _selectedGender = genderOptions.contains(user!.gioitinh) ? user!.gioitinh : 'Nam';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> updateProfile() async {
      String api = API().getUrl('/updateProfileUser');
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
              context, MaterialPageRoute(builder: ((context) => Account())));
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  // margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
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
                  height: 20,
                ),
                Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: ()  async {
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
              ])),
    );
  }
}
