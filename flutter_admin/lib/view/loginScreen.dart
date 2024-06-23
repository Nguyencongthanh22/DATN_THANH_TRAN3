import 'package:flutter/material.dart';
import 'package:flutter_admin/view/fogotPasswordScreen.dart';
import 'package:flutter_admin/view/registerScreen.dart';
import 'package:flutter/src/material/icons.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String dropdownValue = 'Admin';

  bool isObscure = true;
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
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          style: const TextStyle(color: Colors.black, fontSize: 20),
          underline: Container(
            height: 2,
            color: Colors.red[300],
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: const [
            DropdownMenuItem(value: 'Admin', child: Text('Admin')),
            DropdownMenuItem(value: 'Nhân vien', child: Text('Nhân vien')),
          ],
        ),
        const SizedBox(height: 30),
        Form(
            child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              //     controller: ,
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
              //     controller: ,
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
            //           controller.loginUser(context);
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
      ])
      ),
    );
  }
}
