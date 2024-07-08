import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_user/methods/api.dart';
import 'package:flutter_user/models/user.dart';
import 'package:flutter_user/view/account.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.token, required this.email});
  final String token;
  final String email;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _ngaySinhController = TextEditingController();
  DateTime? ngaysinh;
  String? Gender;
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
      };
      String api = API().getUrl('/profile');
      final response = await dio.get(api,
          data: formData,
          options: Options(
            headers: {
              'Accept': 'application/json',
            },
          ));
      setState(() {
        user = User.fromJson(jsonDecode(jsonEncode(response.data)));
        _nameController.text = user?.name ?? '';
        _emailController.text = user?.email ?? '';
        _addressController.text = user?.diachi ?? '';
        _phoneController.text = user?.sodienthoai ?? '';

        // Chuyển đổi DateTime thành String nếu cần
        if (user?.ngaysinh != null) {
          if (user!.ngaysinh is DateTime?) {
            _ngaySinhController.text = user!.ngaysinh != null
                ? DateFormat('yyyy-MM-dd').format(user!.ngaysinh!)
                : '';
          } else {
            _ngaySinhController.text = user!.ngaysinh.toString();
          }
        } else {
          _ngaySinhController.text = '';
        }

        Gender = user?.gioitinh ?? '';
      });
    });
  }

  Future<void> updateProfile() async {
    String api = API().getUrl('/updateProfileUser');
    try {
      final response = await dio.put(
        api,
        data: {
          'email': widget.email,
          'name': _nameController.text,
          'diachi': _addressController.text,
          'sodienthoai': _phoneController.text,
          'ngaysinh': _ngaySinhController.text,
          'gioitinh': namegender,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => Account())));
      } else {
        print('Failed to update profile: ${response.data}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        ngaysinh = picked;
        _ngaySinhController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hồ sơ"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TÀI KHOẢN: ${widget.email}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "TÊN",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _nameController,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                labelText: "Vui lòng nhập tên của bạn",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: Colors.black45),
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "SỐ ĐIỆN THOẠI",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _phoneController,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                labelText: "Vui lòng nhập số điện thoại của bạn",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: Colors.black45),
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "ĐỊA CHỈ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _addressController,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                labelText: "Vui lòng nhập địa chỉ của bạn",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: Colors.black45),
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "NGÀY SINH",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _ngaySinhController,
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());
                await _selectDate(context);
              },
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                labelText: "Vui lòng nhập ngày sinh của bạn",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: Colors.black45),
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "GIỚI TÍNH",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              value: dropdownValueNam,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValueNam = newValue!;
                  namegender = GenderValueMap[dropdownValueNam]!;
                });
              },
              items: <String>['1', '2', '3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(GenderValueMap[value]!),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}
