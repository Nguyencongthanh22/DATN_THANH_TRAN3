import 'package:flutter/material.dart';

class AddPromotion extends StatefulWidget {
  const AddPromotion({super.key});

  @override
  State<AddPromotion> createState() => _AddPromotionState();
}

class _AddPromotionState extends State<AddPromotion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Thêm mã giảm giá',
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
        Form(
            child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              //     controller: ,
              decoration: InputDecoration(
                  labelText: "Tên khuyễn mãi",
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
                labelText: "Phần trăm giảm giá",
                fillColor: Colors.red[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              // validator: (value){
              //   if(value==null || controller.passwordController.text.isEmpty){
              //     return "Vui lòng nhập mat khau";
              //   }
              // },
              // obscureText: true,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              //     controller: ,
              decoration: InputDecoration(
                  labelText: "Ngày áp dụng",
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
                  labelText: "Ngày hết hạn",
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
              "Thêm",
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
      ])),
    );
  }
}
