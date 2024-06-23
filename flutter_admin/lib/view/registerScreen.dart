import 'package:flutter/material.dart';
import 'package:flutter_admin/view/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              //     controller: ,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  fillColor: Colors.red[200],
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
                labelText: "Mat khau",
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
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                ),
              ),

              obscureText: isObscure,
              obscuringCharacter: "•",
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              //     controller: ,
              decoration: InputDecoration(
                labelText: "Xác nhận mật khẩu",
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
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                ),
              ),

              obscureText: isObscure,
              obscuringCharacter: "•",
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              //     controller: ,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  fillColor: Colors.red[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              //     controller: ,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                  labelText: "Địa chỉ",
                  fillColor: Colors.red[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
        ])),
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
                // chuyển sang màn hình đăng ký
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
      ])),
    );
  }
}
