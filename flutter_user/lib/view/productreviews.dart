import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../methods/api.dart';

class ProductCard extends StatelessWidget {
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

  Widget buildStarRating(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < rating; i++) {
      stars.add(Icon(Icons.star, color: Colors.amber, size: 18));
    }
    for (int i = rating; i < 5; i++) {
      stars.add(Icon(Icons.star_border, color: Colors.grey, size: 18));
    }
    return Row(
      children: stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tài khoản: ${userName ?? ''}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            buildStarRating(rate),
            Text('Nội dung: ${comment ?? ''}', style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(date,
                    style: TextStyle(fontSize: 13, color: Colors.grey[700])),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardReview extends StatefulWidget {
  CardReview({required this.id_sp});
  int? id_sp;
  @override
  _CardReviewState createState() => _CardReviewState();
}

class _CardReviewState extends State<CardReview> {
  late Future<List<ProductCard>> _reviewsFuture;

  @override
  void initState() {
    super.initState();
    _reviewsFuture = fetchReviews();
  }

  Dio dio = Dio();
  Future<List<ProductCard>> fetchReviews() async {
    try {
      String api = await API().getUrl('/getAllReviews');
      final response = await dio.get(
        api,
        queryParameters: {'id_sp':widget.id_sp},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
      print('Response Data: ${response.data}');
      if (response.statusCode == 200) {
        Map<String, dynamic>? data = response.data as Map<String, dynamic>?;
        if (data != null) {
          List<dynamic>? reviews = data['reviews'] as List<dynamic>?;
          if (reviews != null) {
            return reviews.map((review) {
              return ProductCard(
                userName: review['ten'] ?? '',
                date: review['ngay'] ??
                    '', // Adjust this to your actual date field
                rate: review['diem'] ?? 0,
                comment: review['danhgia'] ?? '',
              );
            }).toList();
          }
        }
        return []; // Return empty list if no reviews are available
      } else {
        throw Exception('Failed to load reviews: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load reviews: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ProductCard>>(
        future: _reviewsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No reviews available'));
          } else {
            return ListView(
              children: snapshot.data!,
            );
          }
        },
      ),
    );
  }
}
