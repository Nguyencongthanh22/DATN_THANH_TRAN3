import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Method/api.dart';
import '../models/Order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListCardProductOrder extends StatefulWidget {
  ListCardProductOrder({
    super.key,
    //required this.initialIndex
  });
  //int initialIndex;

  @override
  _ListCardProductOrderState createState() => _ListCardProductOrderState();
}

late Future<String?> futureEmail;

class _ListCardProductOrderState extends State<ListCardProductOrder> {
  late List<Order> _ordersXacnhan = [];
  late List<Order> _ordersDangXuly = [];
  late List<Order> _ordersDangGiao = [];
  late List<Order> _ordersDaGiao = [];
  late List<Order> _ordersDaHuy = [];

  @override
  void initState() {
    super.initState();
    futureEmail = getUserEmail();
    _fetchOrders('choxacnhan').then((orders) {
      setState(() {
        _ordersXacnhan = orders;
      });
    });
    _fetchOrders('dangxuly').then((orders) {
      setState(() {
        _ordersDangXuly = orders;
      });
    });
    _fetchOrders('danggiao').then((orders) {
      setState(() {
        _ordersDangGiao = orders;
      });
    });
    _fetchOrders('dagiao').then((orders) {
      setState(() {
        _ordersDaGiao = orders;
      });
    });
    _fetchOrders('dahuy').then((orders) {
      setState(() {
        _ordersDaHuy = orders;
      });
    });
  }

  Future<List<Order>> _fetchOrders(String status) async {
    try {
      String api = API().getUrl('/getOrder');
      final response = await Dio().get(
        api,
        queryParameters: {'trangthai': status},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Order> orders = data.map((json) => Order.fromJson(json)).toList();
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

  void _updateOrder(int id, String status) async {
    String api = API().getUrl('/updateOrder');
    try {
      final response = await Dio().put(
        api,
        data: {
          'id': id,
          'trangthai': status, // Cập nhật trạng thái
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Cập nhật đơn hàng thành công');
        setState(() {
          if (status == 'dahuy') {
            Order cancelledOrder =
                _ordersXacnhan.firstWhere((order) => order.id == id);
            _cancelOrderXacnhan(cancelledOrder);
          } else if (status == 'choxacnhan') {
            Order orderToRebuy =
                _ordersDaHuy.firstWhere((order) => order.id == id);
            _ordersDaHuy.remove(orderToRebuy);
            _ordersXacnhan.add(orderToRebuy);
          }
          // Cập nhật lại danh sách đơn hàng cho tab tương ứng
          switch (status) {
            case 'choxacnhan':
              _fetchOrders('choxacnhan').then((orders) {
                setState(() {
                  _ordersXacnhan = orders;
                });
              });
              break;
            case 'dangxuly':
              _fetchOrders('dangxuly').then((orders) {
                setState(() {
                  _ordersDangXuly = orders;
                });
              });
              break;
            case 'danggiao':
              _fetchOrders('danggiao').then((orders) {
                setState(() {
                  _ordersDangGiao = orders;
                });
              });
              break;
            case 'dagiao':
              _fetchOrders('dagiao').then((orders) {
                setState(() {
                  _ordersDaGiao = orders;
                });
              });
              break;
            case 'dahuy':
              _fetchOrders('dahuy').then((orders) {
                setState(() {
                  _ordersDaHuy = orders;
                });
              });
              break;
          }
        });
      } else {
        print('Cập nhật đơn hàng thất bại: ${response.data}');
        // Xử lý các trường hợp lỗi
      }
    } catch (e) {
      print('Lỗi: $e');
      // Xử lý các trường hợp lỗi
    }
  }

  String? email;
  Future<String?> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email');
    print('___________${email}');
    return email;
  }

  void _updateOrder2(int id, String status) async {
    String api = API().getUrl('/updateOrderChoxacnhan');
    try {
      final response = await Dio().put(
        api,
        data: {'id': id, 'trangthai': status, 'email_nv': email},
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Cập nhật đơn hàng thành công');
        setState(() {
          if (status == 'dangxuly') {
            Order cancelledOrder =
                _ordersXacnhan.firstWhere((order) => order.id == id);
            _cancelOrderXacnhan(cancelledOrder);
          } else if (status == 'danggiao') {
            Order orderToRebuy =
                _ordersDangXuly.firstWhere((order) => order.id == id);
            _cancelOrderdangxuly(orderToRebuy);
          } else if (status == 'dagiao') {
            Order orderToRebuy =
                _ordersDangGiao.firstWhere((order) => order.id == id);
            _cancelOrderchogiaohang(orderToRebuy);
          }
          switch (status) {
            case 'choxacnhan':
              _fetchOrders('choxacnhan').then((orders) {
                setState(() {
                  _ordersXacnhan = orders;
                });
              });
              break;
            case 'dangxuly':
              _fetchOrders('dangxuly').then((orders) {
                setState(() {
                  _ordersDangXuly = orders;
                });
              });
              break;
            case 'danggiao':
              _fetchOrders('danggiao').then((orders) {
                setState(() {
                  _ordersDangGiao = orders;
                });
              });
              break;
            case 'dagiao':
              _fetchOrders('dagiao').then((orders) {
                setState(() {
                  _ordersDaGiao = orders;
                });
              });
              break;
            case 'dahuy':
              _fetchOrders('dahuy').then((orders) {
                setState(() {
                  _ordersDaHuy = orders;
                });
              });
              break;
          }
        });
      } else {
        print('Cập nhật đơn hàng thất bại: ${response.data}');
      }
    } catch (e) {
      print('Lỗi: $e');
    }
  }

  void _cancelOrderXacnhan(Order order) {
    setState(() {
      _ordersXacnhan.remove(order);
      _ordersDangXuly.add(order);
    });
  }

  void _cancelOrderdangxuly(Order order) {
    setState(() {
      _ordersDangXuly.remove(order);
      _ordersDangGiao.add(order);
    });
  }

  void _cancelOrderchogiaohang(Order order) {
    setState(() {
      _ordersDangGiao.remove(order);
      _ordersDaGiao.add(order);
    });
  }

  Widget _buildOrderList(List<Order> orders, String status) {
    return orders.isEmpty
        ? Center(child: Text('Không có đơn hàng $status'))
        : ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              Order order = orders[index];
              return OrderCard(
                  order: order,
                  status: status,
                  onUpdate: () => _updateOrder2(order.id, 'dangxuly'));
            },
          );
  }

  Widget _buildOrderListdangxuly(List<Order> orders, String status) {
    return orders.isEmpty
        ? Center(child: Text('Không có đơn hàng $status'))
        : ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              Order order = orders[index];
              return OrderCard2(
                  order: order,
                  status: status,
                  email: email,
                  onUpdate: () => _updateOrder2(order.id, 'danggiao'));
            },
          );
  }

  Widget _buildOrderListdanggiao(List<Order> orders, String status) {
    return orders.isEmpty
        ? Center(child: Text('Không có đơn hàng $status'))
        : ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              Order order = orders[index];
              return OrderCard2(
                  order: order,
                  status: status,
                  email: email,
                  onUpdate: () => _updateOrder2(order.id, 'dagiao'));
            },
          );
  }

  Widget _buildOrderLisDagiaovatHuy(List<Order> orders) {
    return orders.isEmpty
        ? Center(child: Text('Không có đơn hàng '))
        : ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              Order order = orders[index];
              return OrderCardDagiao(
                order: order,
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //initialIndex: widget.initialIndex,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[200],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            "Đơn hàng của tôi",
            style: TextStyle(fontSize: 25),
          ),
          bottom: const TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            isScrollable: true,
            tabs: [
              Tab(child: Text("Chờ xác nhận")),
              Tab(child: Text("Đang xử lý")),
              Tab(child: Text("Chờ giao hàng")),
              Tab(child: Text("Đã giao")),
              Tab(child: Text("Đã hủy")),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildOrderList(_ordersXacnhan, "Chờ Xác Nhận"),
            _buildOrderListdangxuly(_ordersDangXuly, "Đang xử lý"),
            _buildOrderListdanggiao(_ordersDangGiao, "Chờ giao hàng"),
            _buildOrderLisDagiaovatHuy(_ordersDaGiao),
            _buildOrderLisDagiaovatHuy(_ordersDaHuy),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  final String status;
  final VoidCallback onUpdate;

  const OrderCard({
    required this.order,
    required this.status,
    required this.onUpdate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('#dh90${order.id}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                status,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: Image.network(
                order.image, // Replace with your image field
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.email ?? '', // Replace with your email field
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Total: ${order.tongtien}', // Replace with your total field
                    style: const TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: onUpdate,
                          child: const Text(
                            "Nhận đơn hàng",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class OrderCard2 extends StatelessWidget {
  final Order order;
  final String status;
  final String? email;
  final VoidCallback onUpdate;

  const OrderCard2({
    required this.order,
    required this.status,
    required this.onUpdate,
    Key? key, required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return email==order.email_nv? Column(
      children:  [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('#dh90${order.id}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                status,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: Image.network(
                order.image, // Replace with your image field
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.email ?? '', // Replace with your email field
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Total: ${order.tongtien}', // Replace with your total field
                    style: const TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: onUpdate,
                          child: const Text(
                            "Nhận đơn hàng",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ): Center();
  }
}

class OrderCardDagiao extends StatelessWidget {
  final Order order;

  const OrderCardDagiao({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('#dh90${order.id}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '',
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: Image.network(
                order.image, // Replace with your image field
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.email ?? '', // Replace with your email field
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Total: ${order.tongtien}', // Replace with your total field
                    style: const TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Đánh giá'))
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
