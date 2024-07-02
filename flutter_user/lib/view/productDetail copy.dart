import 'package:flutter/material.dart';
import 'package:flutter_user/view/numberUpDown.dart';
import 'package:flutter_user/view/cardProducReview.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late List<RadioButtonModel> radioOptionsColor;
  late List<RadioButtonModel> radioOptionsSize;

  @override
  void initState() {
    super.initState();
    radioOptionsColor = [
      RadioButtonModel(isSelected: false, buttonText: 'Vàng'),
      RadioButtonModel(isSelected: false, buttonText: 'Hồng'),
      RadioButtonModel(isSelected: false, buttonText: 'Đen'),
      RadioButtonModel(isSelected: false, buttonText: 'Trắng'),
    ];
    radioOptionsSize = [
      RadioButtonModel(isSelected: false, buttonText: 'S'),
      RadioButtonModel(isSelected: false, buttonText: 'M'),
      RadioButtonModel(isSelected: false, buttonText: 'L'),
      RadioButtonModel(isSelected: false, buttonText: 'XL'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
        title: Text('Product Detail'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tên sản phẩm",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("5/5", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Container(
              height: 250,
              width: double.infinity,
              child: Placeholder(), // Thay bằng hình ảnh thực tế của sản phẩm
            ),
            SizedBox(height: 16),
            Text("Màu sắc", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Row(
              children: [
                for (var option in radioOptionsColor)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        for (var other in radioOptionsColor) {
                          if (other != option) {
                            other.isSelected = false;
                          }
                        }
                        option.isSelected = !option.isSelected;
                      });
                    },
                    child: SquareRadioButtonItem(option),
                  ),
              ],
            ),
            SizedBox(height: 16),
            Text("Kích cỡ", style: TextStyle(fontSize: 18)),
            Row(
              children: [
                for (var option in radioOptionsSize)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        for (var other in radioOptionsSize) {
                          if (other != option) {
                            other.isSelected = false;
                          }
                        }
                        option.isSelected = !option.isSelected;
                      });
                    },
                    child: SquareRadioButtonItem(option),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text("Số lượng", style: TextStyle(fontSize: 18)),
            Container(
              margin: EdgeInsets.all(15),
              height: 50,
              width: 200,
              child: NumberUpDown(onChanged: (int) {}),
            ),
            SizedBox(height: 15),
            Text("283.000 VND",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 25),
            Text("Mô tả",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(
                "Các phần lưới được ánh xạ (đan vào vải) chứ không phải khâu lại với nhau đảm bảo cảm giác êm ái, nhẹ nhàng.",
                style: TextStyle(
                  fontSize: 15,
                )),
            SizedBox(height: 30),
            Text("Đánh giá",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                child: CardReview())
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: MaterialButton(
                color: Colors.red[400],
                onPressed: () {
                  // Xử lý khi nhấn vào Thêm giỏ hàng
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        // child: Text('Thêm giỏ hàng'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 16), // Khoảng cách giữa hai button
            Expanded(
              child: MaterialButton(
                color: Colors.red[400],
                onPressed: () {
                  // Xử lý khi nhấn vào Mua ngay
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Text(
                    'Mua ngay',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioButtonModel {
  late bool isSelected;
  final String buttonText;

  RadioButtonModel({
    required this.isSelected,
    required this.buttonText,
  });
}

class SquareRadioButtonItem extends StatelessWidget {
  final RadioButtonModel _item;

  const SquareRadioButtonItem(this._item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Text(
                _item.buttonText,
                style: TextStyle(
                  color: _item.isSelected ? Colors.white : Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected ? Colors.red[200] : Colors.transparent,
              border: Border.all(
                width: 1.0,
                color: _item.isSelected ? Colors.red : Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(2.0)),
            ),
          ),
        ],
      ),
    );
  }
}
