import 'package:flutter/material.dart';
import 'package:flutter_admin/view/cardPromotion.dart';
import 'package:flutter_admin/view/addPromotion.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Khuyễn Mãi',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
        actions: [
          FloatingActionButton(
            mini: true,
            onPressed: () {
              // showDialog(context: context, builder: builder)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPromotion(),
                ),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.red[200],
          ),
        ],
      ),
      body: CardPromotion(),
    );
  }
}
