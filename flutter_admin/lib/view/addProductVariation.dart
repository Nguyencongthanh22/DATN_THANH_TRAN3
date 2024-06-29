import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_admin/view/cardAddProductVariation.dart';
import 'addProduct.dart';

class AddProductVariation extends StatefulWidget {
  const AddProductVariation({Key? key});

  @override
  State<AddProductVariation> createState() => _AddProductState();
}

class _AddProductState extends State<AddProductVariation> {
  List<Widget> productCard = [];

  String dropdownValueColor = 'Trắng';
  String dropdownValueSize = 'S';

  @override
  Widget build(BuildContext context) {
    var productCards;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Them san pham',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          leading: IconButton(
              onPressed: () => AddProduct(),
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
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Cho phép scroll ngang
              itemCount: productCards.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: productCard[index], // Hiển thị từng card sản phẩm
                );
              },
            ),
          ),
          Form(
              child: Column(children: [
            Container(
              height: 55,
              width: 700,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValueColor,
                icon: const Icon(Icons.arrow_drop_down),
                style: const TextStyle(color: Colors.black, fontSize: 20),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueColor = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'Trắng', child: Text('Trắng')),
                  DropdownMenuItem(value: 'Đen', child: Text('Đen')),
                  DropdownMenuItem(
                      value: 'Xanh dương', child: Text('Xanh dương')),
                  DropdownMenuItem(value: 'Xanh lá', child: Text('Xanh lá')),
                  DropdownMenuItem(value: 'Đỏ', child: Text('Đỏ')),
                  DropdownMenuItem(value: 'Vàng', child: Text('Vàng')),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 55,
              width: 700,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValueSize,
                icon: const Icon(Icons.arrow_drop_down),
                style: const TextStyle(color: Colors.black, fontSize: 20),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueSize = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'S', child: Text('S')),
                  DropdownMenuItem(value: 'M', child: Text('M')),
                  DropdownMenuItem(value: 'L', child: Text('L')),
                  DropdownMenuItem(value: 'XL', child: Text('XL')),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Số lượng",
                    fillColor: Colors.red[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
          ])),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
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
        bottomNavigationBar: BottomAppBar(
            child: Column(
          children: [
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text('Hoan tat'),
              ),
            ),
          ],
        )));
  }
}
