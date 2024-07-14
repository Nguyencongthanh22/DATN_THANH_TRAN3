import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user/view/logInScreen.dart';
import '../methods/api.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  void register() async {
    // Hash the password
    var bytes = utf8.encode(passwordController.text);
    var hashedPassword = sha256.convert(bytes).toString();

    final data = {
      'email': emailController.text.toString(),
      'name': nameController.text.toString(),
      'password': hashedPassword,
    };
    
    final result = await API().postRequset(route: '/register', data: data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LogInScreen()));
    } else {
      print('Error________________: ${response['message']}');
    }
  }

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
                )
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
                          )),
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
                          )),
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
                          icon: Icon(
                              isObscure ? Icons.visibility : Icons.visibility_off),
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
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Bạn đã có tài khoản? "),
                InkWell(
                  onTap: () {
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
