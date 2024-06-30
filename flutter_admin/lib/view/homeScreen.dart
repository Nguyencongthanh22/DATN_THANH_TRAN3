import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'addProduct.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeScreen> {
  @override
  final List<String> imagelist = [
    "assets/hinh.jpg",
    "assets/hinh2.jpg",
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.47,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(),
                            );
                          },
                        ),
                        InkWell(
                          child: Text(
                            "Bạn đang tìm kiếm gì?",
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Column(children: [
                                    ButtonBar(
                                      alignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                        title: Column(
                                                            children: [
                                                          ButtonBar(
                                                            alignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo thun')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo polo')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo thun in họa tiết')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo bra top')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo nỉ & áo hoodie')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo sơ mi & áo kiểu')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo len')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo cadigan')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Peace for all')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Áo')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo blouson & ao parka')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo khoác & áo Blazer')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo choàng dáng dài')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo khoác siêu nhẹ & pufftech')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Đồ mặc ngoài')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần short')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần jeans')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần easy pants')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần ống rộng')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần dài đến mắt cả & quần lửng')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần nỉ')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần legging')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần tây')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Quần')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Đầm & jumpsuit')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Chân váy')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Đầm & chân váy')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                AddProduct()));
                                                                  },
                                                                  child: Text(
                                                                      'Sport utility wear')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                AddProduct()));
                                                                  },
                                                                  child: Text(
                                                                      'Sản phẩm chống nắng')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo bra')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo bra top')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('AlRism đồ mặc trong')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Đồ lót')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần leggings & quần tất')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Tất')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('HEATTECH đồ mặc trong & quần lót giữ nhiệt')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Đồ mặc trong & đồ lót')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần easy & relaxed')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Đồ mặc nhà & pyjama')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Dép đi trong nhà')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Đồ mặc nhà')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Túi')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Giày & sandals')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Kính mát')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Mũ & mũ lưới trai')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Thắt lưng')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Ô')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Khăn choàng & khăn quàng cổ')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Găng tay')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Khác')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Phụ kiện')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Đồ mặc trong')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Đồ bầu')),
                                                            ],
                                                          )
                                                        ]));
                                                  });
                                            },
                                            child: Text('Nữ')),
                                        ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                        title: Column(
                                                            children: [
                                                          ButtonBar(
                                                            alignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(onPressed: () {}, child: Text('Áo thun')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(onPressed: () {}, child: Text('Áo polo')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(onPressed: () {}, child: Text('Áo thun in họa tiết')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(onPressed: () {}, child: Text('Áo nỉ & áo hoodie')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(onPressed: () {}, child: Text('Áo sơ mi công sở')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(onPressed: () {}, child: Text('Áo sơ mi casual')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(onPressed: () {}, child: Text('Peace for all')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Áo')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần short')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần miracle air')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần dài đến mắt cá')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần jeans & jean màu')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần dài dáng rộng')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần chino')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần tây')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần casual')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần nỉ')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Quần')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Túi')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Kính mát')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Mũ & mũ lưới trai')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Thắt lưng')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Ô')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Khăn choàng & khăn quàng cổ')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Găng tay')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Khác')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Phụ kiện')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                AddProduct()));
                                                                  },
                                                                  child: Text(
                                                                      'Sport utility wear')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                AddProduct()));
                                                                  },
                                                                  child: Text(
                                                                      'Sản phẩm chống nắng')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('AlRism đồ mặc trong')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần lót boxer & brief')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Tất')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('HEATTECH đồ mặc trong & quần lót giữ nhiệt')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần leggings & quần tất')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Đồ mặc trong & đồ lót')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Đồ mặc nhà & pyjama')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần easy & relaxed')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Dép đi trong nhà')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Đồ mặc nhà')),
                                                            ],
                                                          )
                                                        ]));
                                                  });
                                            },
                                            child: Text('Nam')),
                                        ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                        title: Column(
                                                            children: [
                                                          ButtonBar(
                                                            alignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo thun in họa tiết')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo thun & áo polo')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo nỉ & áo hoodie')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo sơ mi & áo kiểu')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo len & áo cardigan')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Áo')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo blouson & ao parka')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo khoác')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Đồ mặc ngoài')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần short')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần dài')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Quần')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Đầm')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Chân váy')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Đầm & chân váy')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                AddProduct()));
                                                                  },
                                                                  child: Text(
                                                                      'Sport utility wear')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                AddProduct()));
                                                                  },
                                                                  child: Text(
                                                                      'Sản phẩm chống nắng')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('AIRISM đồ mặc trong')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Đồ lót')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo bra và bra tops')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Tất')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('HEATTECH đồ mặc trong & quần lót giữ nhiệt')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Đồ mặc trong & đồ lót')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                AddProduct()));
                                                                  },
                                                                  child: Text(
                                                                      'Đồ mặc nhà')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                AddProduct()));
                                                                  },
                                                                  child: Text(
                                                                      'Phụ kiện')),
                                                            ],
                                                          )
                                                        ]));
                                                  });
                                            },
                                            child: Text('Trẻ em')),
                                        ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                        title: Column(
                                                            children: [
                                                          ButtonBar(
                                                            alignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Đồ liền mảnh')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Bodysuit')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo thun in hoạ tiết')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Tất')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('HEATTECH đồ mặc trong & quần lót giữ nhiệt')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Em bé (0-1 tuổi)')),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                              title: Column(children: [
                                                                            ButtonBar(
                                                                              alignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Đồ mặc nhà & pyjama')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Quần dài & quần legging')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Áo thun in hoạ tiết')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Đồ mặc ngoài')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Tất')),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                                                                                    },
                                                                                    child: Text('Phụ kiện')),
                                                                              ],
                                                                            )
                                                                          ]));
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      'Em bé (6 tháng -5 tuổi)')),
                                                            ],
                                                          )
                                                        ]));
                                                  });
                                            },
                                            child: Text('Em bé')),
                                      ],
                                    )
                                  ]),
                                );
                              });
                        },
                        child: Icon(Icons.add),
                        backgroundColor: Colors.red[200],
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              bottom: TabBar(tabs: [
                Tab(
                  text: "HOME",
                ),
                Tab(
                  text: "NAM",
                ),
                Tab(
                  text: "NỮ",
                ),
                Tab(
                  text: "TRẺ EM",
                ),
                Tab(
                  text: "TRẺ SƠ SINH",
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                Center(
                    child: Column(children: [
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        viewportFraction: 1.0,
                      ),
                      items: imagelist.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                              ),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  )
                ])),
                Center(child: Text('Favorites Tab')),
                Center(child: Text('Settings Tab')),
                Center(child: Text('Favorites Tab')),
                Center(child: Text('Settings Tab')),
              ],
            ),
            //   bottomNavigationBar: BottomNavigationBar(),
          )),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Kết quả tìm kiếm cho: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Gợi ý tìm kiếm'),
    );
  }
}
