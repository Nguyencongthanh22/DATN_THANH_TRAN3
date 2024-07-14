import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../methods/api.dart';
import '../models/Order.dart';
import 'orderProductDetail.dart';
import 'productreviews.dart';

class ListCardProductOrder extends StatefulWidget {
  ListCardProductOrder({super.key, required this.initialIndex});
  int initialIndex;

  @override
  _ListCardProductOrderState createState() => _ListCardProductOrderState();
}

class _ListCardProductOrderState extends State<ListCardProductOrder> {
  late List<Order> _ordersXacnhan = [];
  late List<Order> _ordersDangXuly = [];
  late List<Order> _ordersDangGiao = [];
  late List<Order> _ordersDaGiao = [];
  late List<Order> _ordersDaHuy = [];
  late Future<String?> futureEmail;
  String? emails;
  Future<String?> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    emails = preferences.getString('email');
    print('___________${emails}');
    return emails;
  }

  @override
void initState() {
  super.initState();
  futureEmail = getUserEmail().then((email) {
    emails = email;
    _initializeOrders();
  });
}

void _initializeOrders() {
  _fetchOrders('choxacnhan', emails).then((orders) {
    setState(() {
      _ordersXacnhan = orders;
    });
  });
  _fetchOrders('dangxuly', emails).then((orders) {
    setState(() {
      _ordersDangXuly = orders;
    });
  });
  _fetchOrders('danggiao', emails).then((orders) {
    setState(() {
      _ordersDangGiao = orders;
    });
  });
  _fetchOrders('dagiao', emails).then((orders) {
    setState(() {
      _ordersDaGiao = orders;
    });
  });
  _fetchOrders('dahuy', emails).then((orders) {
    setState(() {
      _ordersDaHuy = orders;
    });
  });
}


  Future<List<Order>> _fetchOrders(String status,String? email) async {
  try {
    String api = API().getUrl('/getOrder');
    final response = await Dio().get(
      api,
      queryParameters: {'trangthai': status,'email':email  },
      options: Options(
        headers: {'Accept': 'application/json'},
      ),
    );
    print('Response data: ${response.data}');

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['orders']; 
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
              _fetchOrders('choxacnhan',emails).then((orders) {
                setState(() {
                  _ordersXacnhan = orders;
                });
              });
              break;
            case 'dangxuly':
              _fetchOrders('dangxuly',emails).then((orders) {
                setState(() {
                  _ordersDangXuly = orders;
                });
              });
              break;
            case 'danggiao':
              _fetchOrders('danggiao',emails).then((orders) {
                setState(() {
                  _ordersDangGiao = orders;
                });
              });
              break;
            case 'dagiao':
              _fetchOrders('dagiao',emails).then((orders) {
                setState(() {
                  _ordersDaGiao = orders;
                });
              });
              break;
            case 'dahuy':
              _fetchOrders('dahuy',emails).then((orders) {
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

  void _cancelOrderXacnhan(Order order) {
    setState(() {
      _ordersXacnhan.remove(order);
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
                  onUpdate: () => _updateOrder(order.id, 'dahuy'));
            },
          );
  }

  Widget _buildOrderListChogiaodon(List<Order> orders, String status) {
    return orders.isEmpty
        ? Center(child: Text('Không có đơn hàng $status'))
        : ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              Order order = orders[index];
              return OrderCardDagiao(order: order, status: status);
            },
          );
  }

  Widget _buildOrderList3(List<Order> orders, String status) {
    return orders.isEmpty
        ? Center(child: Text('Không có đơn hàng $status'))
        : ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              Order order = orders[index];
              return OrderCardDagiao(order: order, status: status);
            },
          );
  }

  Widget _buildOrderListHuy(List<Order> orders, String status) {
    return orders.isEmpty
        ? Center(child: Text('Không có đơn hàng $status'))
        : ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              Order order = orders[index];
              return OrderCardHUY(
                  order: order,
                  status: status,
                  onUpdate2: () => _updateOrder(order.id, 'choxacnhan'));
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initialIndex,
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
            _buildOrderListChogiaodon(_ordersDangXuly, "Đang xử lý"),
            _buildOrderListChogiaodon(_ordersDangGiao, "Chờ giao hàng"),
            _buildOrderList3(_ordersDaGiao, "Đã giao"),
            _buildOrderListHuy(_ordersDaHuy, "Đã hủy"),
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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderProductDetail(
              id: order.id,
              trangthai: order.trangthai,
            ),
          ),
        );
      },
      child: Column(
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
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 130,
                height: 130,
                child: Image.network(
                  order.image ?? '', // Replace with your image field
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
                              "Hủy đơn hàng",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderCardDagiao extends StatelessWidget {
  final Order order;
  final String status;

  const OrderCardDagiao({
    required this.order,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderProductDetail(
                      id: order.id,
                      trangthai: order.trangthai,
                    )));
      },
      child: Column(
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
                  order.image ?? '', // Replace with your image field
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.email ?? '',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Total: ${order.tongtien}',
                      style: const TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class OrderCardHUY extends StatelessWidget {
  final Order order;
  final String status;
  final VoidCallback onUpdate2;

  const OrderCardHUY({
    required this.order,
    required this.status,
    required this.onUpdate2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderProductDetail(
              id: order.id,
              trangthai: order.trangthai,
            ),
          ),
        );
      },
      child: Column(
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
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 130,
                height: 130,
                child: Image.network(
                  order.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.email ?? '',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Total: ${order.tongtien}',
                      style: const TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: onUpdate2,
                      child: const Text(
                        "Mua lại",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}