import 'package:flutter/material.dart';
import 'package:flutter_admin/view/detailStaffInfo.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final bool isHighlighted;

  const ProductCard({
    required this.productName,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () {
          // Navigating to staff detail screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailStaffInfo(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
                // top: BorderSide(color: Colors.grey),
                // bottom: BorderSide(color: Colors.grey),
                ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isHighlighted ? Colors.red : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StaffDetailScreen extends StatelessWidget {
  final String productName;

  const StaffDetailScreen({required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Center(
        child: Text('Staff Detail: $productName'),
      ),
    );
  }
}

class CardStaffInfo extends StatefulWidget {
  const CardStaffInfo({super.key});

  @override
  State<CardStaffInfo> createState() => _CardStaffInfoState();
}

class _CardStaffInfoState extends State<CardStaffInfo> {
  final List<ProductCard> products = [
    ProductCard(
      productName: "Staff 1",
      isHighlighted: true,
    ),
    ProductCard(
      productName: "Staff 2",
      isHighlighted: false,
    ),
    ProductCard(
      productName: "Staff 3",
      isHighlighted: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
        title: Text('Danh sách nhân viên'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return products[index];
        },
      ),
    );
  }
}
