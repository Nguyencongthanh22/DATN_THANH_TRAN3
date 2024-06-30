import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_user/methods/api.dart';
import 'package:flutter_user/models/user.dart';
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
  List<String> genderOptions = ['Nam', 'Nữ', 'Khác'];
  String _selectedGender = 'Nam';
  String test = '';
  User? user;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    //  service = AuthService();

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
        //  _selectedGender = genderOptions.contains(user!.gioitinh) ? user!.gioitinh : 'Nam';
        //  _birthdayController = user!.ngaysinh;
      });
    });

    TextEditingController _dateController = TextEditingController();
    DateTime _selectedDate = DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
          _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  "SINH NHẬT",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.grey[100],
                  height: 50,
                  child: TextFormField(
                    //controller: _birthdayController,
                    // onTap: () => _selectDate(context),
                    readOnly: true,
                    decoration: InputDecoration(
                      //labelText: 'Select date',
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "GIỚI TÍNH",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  color: Colors.grey[100],
                  child: DropdownButtonFormField<String>(
                    value: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                    items: genderOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Vui lòng chọn giới tính",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: const TextStyle(color: Colors.black45),
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(),
                    ),
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
                          onPressed: () {},
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
