import 'package:flutter/material.dart';
import 'addProductVariation.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Thêm sản phẩm',
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
        const SizedBox(height: 30),
        Form(
            child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tên sản phẩm",
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Mô tả",
                fillColor: Colors.red[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Giá",
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
        ])),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProductVariation(),
                  ),
                );
            //           controller.loginUser(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Them",
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
