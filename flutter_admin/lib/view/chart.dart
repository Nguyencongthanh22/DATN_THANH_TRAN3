import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dio/dio.dart';

import '../Method/api.dart';
import '../models/Order.dart';

Dio dio = Dio();

class Order {
  int id;
  String? email;
  String? tongtien;
  String? diachi;
  String? ngaydat; // Assuming this is the order date
  String? trangthai;
  String? email_nv;

  Order({
    required this.id,
    required this.email,
    required this.tongtien,
    required this.diachi,
    required this.ngaydat,
    required this.trangthai,
    required this.email_nv,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      tongtien: json['tongtien'] ?? '',
      diachi: json['diachi'] ?? '',
      ngaydat: json['ngaydat'] ?? '', // Adjust field name based on your Laravel API
      trangthai: json['trangthai'] ?? '',
      email_nv: json['email_nv'] ?? '',
    );
  }
}

class SparkBarChartExample extends StatefulWidget {
  @override
  _SparkBarChartExampleState createState() => _SparkBarChartExampleState();
}

class _SparkBarChartExampleState extends State<SparkBarChartExample> {
  late Future<List<Order>> futureOrder;

  @override
  void initState() {
    super.initState();
    futureOrder = _fetchOrdersAdmin();
  }

  Future<List<Order>> _fetchOrdersAdmin() async {
    try {
      String api = API().getUrl('/getOrderAdmin');
      print('Fetching data from: $api');

      final response = await Dio().get(
        api,
        queryParameters: {'trangthai': 'dagiao'},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      print('Response received: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        print('Parsed response data: $responseData');

        List<dynamic> data = responseData['orders'];
        print('Orders data: $data');

        List<Order> orders = data.map((json) => Order.fromJson(json)).toList();
        print('Parsed orders: $orders');

        return orders;
      } else {
        print('Error fetching data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  Map<String, double> calculateMonthlyTotal(List<Order> orders) {
    Map<String, double> monthlyTotal = {};

    for (Order order in orders) {
      DateTime? orderDate = DateTime.tryParse(order.ngaydat ?? '');
      if (orderDate == null) {
        print('Invalid ngaydat: ${order.ngaydat}');
        continue;
      }
      String monthYear = '${orderDate.month}/${orderDate.year}';

      double amount = double.tryParse(order.tongtien ?? '0.0') ?? 0.0;

      if (monthlyTotal.containsKey(monthYear)) {
        monthlyTotal[monthYear] = (monthlyTotal[monthYear] ?? 0.0) + amount;
      } else {
        monthlyTotal[monthYear] = amount;
      }
    }

    return monthlyTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thống kê doanh thu'),
      ),
      body: Center(
        child: FutureBuilder<List<Order>>(
          future: futureOrder,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('Không tìm thấy doanh thu');
            } else {
              List<Order> orders = snapshot.data!;
              return _buildChart(orders);
            }
          },
        ),
      ),
    );
  }

  Widget _buildChart(List<Order> orders) {
    // Calculate total `tongtien` by month
    Map<String, double> monthlyTotal = calculateMonthlyTotal(orders);

    // Convert to list of `Series` for the chart
    List<charts.Series<MapEntry<String, double>, String>> seriesList = [
      charts.Series<MapEntry<String, double>, String>(
        id: 'Monthly Orders',
        domainFn: (entry, _) => entry.key,
        measureFn: (entry, _) => entry.value,
        data: monthlyTotal.entries.toList(),
        labelAccessorFn: (entry, _) => '${entry.value}', // Display value on the bar
      ),
    ];

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: charts.BarChart(
        seriesList,
        animate: true,
        // Renderer config for a more prominent chart
        defaultRenderer: charts.BarRendererConfig(
          barRendererDecorator: charts.BarLabelDecorator<String>(),
        ),
        // Hide the domain axis
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
        ),
      ),
    );
  }
}
