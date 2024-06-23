import 'package:flutter/material.dart';
import 'package:flutter_user/view/dangnhap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_user/view/homescreen.dart';
import 'dart:convert';

import '../methods/api.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    final data = {
      'email': emailController.text,
      'password': passwordController.text
    };

    final result = await API().postRequset(route: '/login', data: data);

    if (result.statusCode == 200) {
      final response = jsonDecode(result.body);

      if (response != null && response['status'] == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setInt('user_id', response['user']['id']);
        await preferences.setString('name', response['user']['name']);
        await preferences.setString('email', response['user']['email']);
        await preferences.setString('token', response['token']);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response['message'])));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homescreen()));
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
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
