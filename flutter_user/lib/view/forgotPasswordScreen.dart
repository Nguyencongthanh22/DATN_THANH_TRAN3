import 'package:flutter/material.dart';

class ForgotPassWordScreen extends StatefulWidget {
  const ForgotPassWordScreen({super.key});

  @override
  State<ForgotPassWordScreen> createState() => _ForgotPassWordScreenState();
}

class _ForgotPassWordScreenState extends State<ForgotPassWordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Gửi lại mật khẩu',
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
        ]),
      )
      ]
      )));
  }
}