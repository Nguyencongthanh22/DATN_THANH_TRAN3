import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter_admin/view/accout.dart';
import 'package:flutter_admin/view/homeScreen.dart';
import 'package:flutter_admin/view/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Method/api.dart';
import 'fogotPasswordScreen.dart';
import 'registerScreen.dart';

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
    final data = {
      'email': emailController.text,
      'password': passwordController.text
    };

    final result = await API().postRequset(route: '/LoginAdmin', data: data);

    if (result.statusCode == 200) {
      final response = jsonDecode(result.body);

      if (response != null && response['status'] == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setInt('user_id', response['user']['id']);
        await preferences.setString('name', response['user']['name']);
        await preferences.setString('email', response['user']['email']);
        await preferences.setInt('quyen', response['user']['quyen']);
        await preferences.setString('token', response['token']);
        String token = response['token'];
        String email = response['user']['email'];
        int quyen = response['user']['quyen'];
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response['message'])));
       // print(object)
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed: ${response['message']}')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: ${result.statusCode}')));
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
      body: SingleChildScrollView(
          child: Column(children: [
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
            )
          ],
        ),
        const SizedBox(height: 30),
        Form(
            child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email",
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              // validator: (value){
              //   if(value==null || controller.emailController.text.isEmpty){
              //     return "Vui lòng nhập email";
              //   }
              // },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Mật khẩu",
                fillColor: Colors.red[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              // validator: (value){
              //   if(value==null || controller.passwordController.text.isEmpty){
              //     return "Vui lòng nhập mat khau";
              //   }
              // },
              // obscureText: true,
              obscureText: isObscure,
              obscuringCharacter: "•",
            ),
          ),
        ])),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: Text(
                "Quên mật khẩu",
                style: TextStyle(color: Colors.red[300]),
              ),
              onTap: () {
                // chuyển hướng sang màn hình forgotpassword
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPassWordScreen(),
                  ),
                );
              },
            ),
            const SizedBox(width: 20)
          ],
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            login();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Đăng nhập",
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
            const Text("Bạn chưa có tài khoản? "),
            InkWell(
              onTap: () {
                // chuyển sang màn hình đăng ký
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
                    color: Colors.red[300], fontWeight: FontWeight.w300),
              ),
            )
          ],
        )
      ])),
    );
  }
}
