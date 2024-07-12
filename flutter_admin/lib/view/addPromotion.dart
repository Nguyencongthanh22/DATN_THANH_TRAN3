import 'dart:convert';

import 'package:flutter/material.dart';

import '../Method/api.dart';

class AddPromotion extends StatefulWidget {
  const AddPromotion({super.key, required this.id_danhmuc});
  final int? id_danhmuc;
  @override
  State<AddPromotion> createState() => _AddPromotionState();
}

class _AddPromotionState extends State<AddPromotion> {
 TextEditingController tenct = TextEditingController();
  TextEditingController phantram = TextEditingController();
  TextEditingController mota = TextEditingController();

  @override
  void addCoppon() async {
    // Kiểm tra giá trị null
    if (widget.id_danhmuc == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Danh mục ID không được để trống')));
      return;
    }

    if (tenct.text.isEmpty || mota.text.isEmpty || phantram.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vui lòng điền đầy đủ thông tin')));
      return;
    }

    try {
      final data = {
        'tenct': tenct.text.toString(),
        'mota': mota.text.toString(),
        'phantram': int.parse(phantram.text),
        'id_danhmuc': widget.id_danhmuc,
      };

      final result = await API().postRequset(route: '/addCoupons', data: data);
      final response = jsonDecode(result.body);

      if (response['status'] == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Bạn đã thêm khuyến mãi thành công')));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => AddProductVariation(
        //               ten_sp: ten.text,
        //             )));
      } else {
        print('Error________________: ${response['message']}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Mã khuyến mãi này đã tồn tại')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: ${e.toString()}')));
    }
  }

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
                controller: tenct,
                decoration: InputDecoration(
                    labelText: "Tên khuyễn mãi",
                    fillColor: Colors.red[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
              child: TextFormField(
                controller: phantram,
                decoration: InputDecoration(
                  labelText: "Phần trăm giảm giá",
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
                controller: mota,
                decoration: InputDecoration(
                    labelText: "Mô tả",
                    fillColor: Colors.red[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                addCoppon();
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
          ]))
        ])));
  }
}
