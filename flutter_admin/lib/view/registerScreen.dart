import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import '../Method/api.dart';
import 'loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String dropdownValueQuyen = '0';

  void register() async {
    // Hash the password
    var bytes = utf8.encode(passwordController.text);
    var hashedPassword = sha256.convert(bytes).toString();

    final data = {
      'email': emailController.text,
      'name': nameController.text,
      'quyen': int.parse(dropdownValueQuyen),
      'password': hashedPassword,
    };

    final result = await API().postRequset(route: '/registerAdmin', data: data);
    final response = jsonDecode(result.body);

    if (response['status'] == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LogInScreen()));
    } else {
      print('Error________________: ${response['message']}');
    }
  }

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Đăng Ký',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: Colors.grey[400],
              thickness: 1.0,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "2T BOUTIQUE",
                  style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Form(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Tên",
                        fillColor: Colors.red[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.red[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // validator: (value){
                      //   if(value==null || controller.emailController.text.isEmpty){
                      //     return "Vui lòng nhập email";
                      //   }
                      // },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValueQuyen,
                        icon: const Icon(Icons.arrow_drop_down),
                        style: const TextStyle(color: Colors.black, fontSize: 17),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueQuyen = newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem(value: '0', child: Text('Quản lý')),
                          DropdownMenuItem(value: '1', child: Text('Nhân viên')),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Mật khẩu",
                        fillColor: Colors.red[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      obscureText: isObscure,
                      obscuringCharacter: "•",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                register();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Đăng ký",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Bạn đã có tài khoản? "),
                InkWell(
                  onTap: () {
                    // chuyển sang màn hình đăng nhập
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                        color: Colors.red[300], fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
