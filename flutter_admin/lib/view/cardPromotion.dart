import 'package:flutter/material.dart';
import 'package:flutter_admin/view/detailPromotion.dart';

class PromotionCard extends StatelessWidget {
  final String promotionName;

  const PromotionCard({
    required this.promotionName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
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
                  promotionName,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardPromotion extends StatefulWidget {
  const CardPromotion({super.key});

  @override
  State<CardPromotion> createState() => _CardPromotionState();
}

class _CardPromotionState extends State<CardPromotion> {
  final List<PromotionCard> products = [
    PromotionCard(
      promotionName: "promotion 1",
    ),
    PromotionCard(
      promotionName: "promotion 2",
    ),
    PromotionCard(
      promotionName: "promotion 3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPromotion(),
                ),
              );
            },
            child: products[index],
          );
        },
      ),
    );
  }
}
