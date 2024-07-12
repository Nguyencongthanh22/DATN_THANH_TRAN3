import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dio/dio.dart';

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
      ngaydat:
          json['ngaydat'] ?? '', // Adjust field name based on your Laravel API
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
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Response response = await dio
          .get('https://humbly-sacred-mongrel.ngrok-free.app/api/getOrder3');
      List<dynamic> data = response.data;
      List<Order> fetchedOrders =
          data.map((json) => Order.fromJson(json)).toList();
      setState(() {
        orders = fetchedOrders;
      });
    } catch (e) {
      print('Error fetching data: $e');
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
        title: Text('Spark Bar Chart Example'),
      ),
      body: Center(
        child: orders.isEmpty ? CircularProgressIndicator() : _buildChart(),
      ),
    );
  }

  Widget _buildChart() {
    // Tính toán tổng `tongtien` theo tháng
    Map<String, double> monthlyTotal = calculateMonthlyTotal(orders);

    // Chuyển đổi thành danh sách `Series` cho biểu đồ
    List<charts.Series<MapEntry<String, double>, String>> seriesList = [
      charts.Series<MapEntry<String, double>, String>(
        id: 'Monthly Orders',
        domainFn: (entry, _) => entry.key,
        measureFn: (entry, _) => entry.value,
        data: monthlyTotal.entries.toList(),
        labelAccessorFn: (entry, _) =>
            '${entry.value}', // Hiển thị giá trị trên cột
      ),
    ];

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: charts.BarChart(
        seriesList,
        animate: true,
        // Renderer cấu hình để làm cho biểu đồ nổi bật hơn
        defaultRenderer: charts.BarRendererConfig(
          barRendererDecorator: charts.BarLabelDecorator<String>(),
        ),
        // Ẩn trục miền
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
        ),
      ),
    );
  }
}
