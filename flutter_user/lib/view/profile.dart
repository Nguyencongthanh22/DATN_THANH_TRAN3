import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

List<String> _suggestions = [];

class _ProfileState extends State<Profile> {
  final TextEditingController _ten = TextEditingController();
  void _updateSuggestions(String input) {
    setState(() {
      if (input.isEmpty) {
        _suggestions = [];
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    _ten.text = "thanh";
    String? _selectedGender;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_back_ios_rounded)),
            SizedBox(
              width: 100,
            ),
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
                  "ĐỊA CHỈ EMAIL",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "TÊN",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    controller: _ten,
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
                  "HỌ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    // controller: ten,

                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Vui lòng nhập họ của bạn",
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
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    // controller: ten,

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
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    // controller: ten,

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
                    controller: _dateController,
                    onTap: () => _selectDate(context),
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
                      items: <String>['Nam', 'Nữ', 'Khác']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        // labelText: 'Select gender',
                        border: OutlineInputBorder(),
                      ),
                    )),
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
