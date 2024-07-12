import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/Order.dart';

class Example {
  late int _cachedRangeBandShift;

  void initialize() {
    _cachedRangeBandShift = 10; // Initialize the late variable
  }

  void useVariable() {
    print(_cachedRangeBandShift); // Accessing the variable after initialization
  }
}

void main() {
  var example = Example();
  example.initialize();
  example.useVariable(); // Prints: 10
}
class OrderChart extends StatelessWidget {
  final List<Order?> orders;

  OrderChart(this.orders);

  @override
  Widget build(BuildContext context) {
    List<OrderData> data = orders
        .map((order) => OrderData(
              orderId: order?.id.toString() ?? '',
              totalAmount: double.tryParse(order?.tongtien ?? '0') ?? 0,
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Biểu đồ tổng tiền đơn hàng'),
      ),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(16),
          child: charts.BarChart(
            _createSeries(data),
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
            behaviors: [
              charts.SeriesLegend(),
            ],
          ),
        ),
      ),
    );
  }

  List<charts.Series<OrderData, String>> _createSeries(List<OrderData> data) {
    return [
      charts.Series<OrderData, String>(
        id: 'OrderAmount',
        domainFn: (OrderData order, _) => order.orderId,
        measureFn: (OrderData order, _) => order.totalAmount,
        data: data,
      )
    ];
  }
}

class OrderData {
  final String orderId;
  final double totalAmount;

  OrderData({required this.orderId, required this.totalAmount});
}
class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Biểu đồ đơn hàng'),
      ),
      body: OrderChart(Cardproducts),
    );
  }
}

