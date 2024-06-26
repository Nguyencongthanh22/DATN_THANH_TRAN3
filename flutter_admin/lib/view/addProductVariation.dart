import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_admin/view/cardAddProduct.dart';
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
      body: Column(children: [
        Divider(
          color: Colors.grey[400],
          thickness: 1.0,
        ),
        const SizedBox(height: 70),
        Form(
            child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValueColor,
              icon: const Icon(Icons.arrow_drop_down),
              style: const TextStyle(color: Colors.black, fontSize: 17),
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
          const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValueSize,
              icon: const Icon(Icons.arrow_drop_down),
              style: const TextStyle(color: Colors.black, fontSize: 17),
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
          const SizedBox(height: 10),
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
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => AddProductVariation()));
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
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddCardProduct()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Hoàn tất",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ]),
    );
  }
}
