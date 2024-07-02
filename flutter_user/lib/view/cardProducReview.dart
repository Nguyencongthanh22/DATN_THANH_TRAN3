import 'dart:io';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String userName;
  final String date;
  final int rate;
  final String comment;

  ProductCard({
    required this.userName,
    required this.date,
    required this.rate,
    required this.comment,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.userName}', style: TextStyle(fontSize: 25)),
            Text('${widget.rate}/5', style: TextStyle(fontSize: 13)),
            Text('${widget.comment}', style: TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('${widget.date}',
                    style: TextStyle(fontSize: 13, color: Colors.grey[700])),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ProductCard(
                  userName: 'tran',
                  date: '1/1/2024',
                  rate: 5,
                  comment: 'good',
                ),
                ProductCard(
                  userName: 'tran',
                  date: '1/1/2024',
                  rate: 5,
                  comment: 'good',
                ),
                ProductCard(
                  userName: 'tran',
                  date: '1/1/2024',
                  rate: 5,
                  comment: 'good',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
