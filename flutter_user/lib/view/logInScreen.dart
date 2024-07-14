import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user/view/forgotPasswordScreen.dart';
import 'package:flutter_user/view/registerScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../methods/api.dart';
import 'MainScreen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    try {
      // Hash the password
      var bytes = utf8.encode(passwordController.text);
      var hashedPassword = sha256.convert(bytes).toString();

      final data = {
        'email': emailController.text,
        'password': hashedPassword
      };

      final result = await API().postRequset(route: '/login', data: data);

      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);

        if (response != null && response['status'] == 200) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setInt('user_id', response['user']['id']);
          await preferences.setString('name', response['user']['name']??'');
          await preferences.setString('email', response['user']['email']);
          await preferences.setString('sodienthoai', response['user']['sodienthoai']??'');
          await preferences.setString('diachi', response['user']['diachi']??'');
          await preferences.setString('token', response['token'] ?? '');

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Manscreec()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login failed: ${response['message']}')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: ${result.statusCode}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Đăng nhập',
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
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/hinh2.jpg', // Thay link ảnh phù hợp
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // color: Colors.black.withOpacity(0.4), // Màu nền overlay
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "2T BOUTIQUE",
                        style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Form(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: "Mật khẩu",
                              fillColor: Colors.white,
                              labelStyle: TextStyle(color: Colors.black),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                            obscureText: isObscure,
                            obscuringCharacter: "•",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          // Xử lý khi nhấn Quên mật khẩu
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ForgotPasswordScreen(),
                          //   ),
                          // );
                        },
                        child: Text(
                          "Quên mật khẩu",
                          style: TextStyle(color: Colors.red[300]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bạn chưa có tài khoản? "),
                      InkWell(
                        onTap: () {
                          // Xử lý khi nhấn Đăng ký
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                            color: Colors.red[300],
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
