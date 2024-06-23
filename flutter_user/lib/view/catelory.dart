import 'package:flutter/material.dart';

class Catelory extends StatefulWidget {
  const Catelory({super.key});

  @override
  State<Catelory> createState() => _CateloryState();
}

class _CateloryState extends State<Catelory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.09,
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
                    ],
                  ),
                  bottom: TabBar(tabs: [
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
                body: TabBarView(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ÁO",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐỒ MẶC NGOÀI",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "QUẦN",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PHỤ KIỆN",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SẢN PHẨM CHỐNG NẮNG",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐỒ MẶC TRONG VÀ ĐỒ LÓT",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐỒ MẶC NHÀ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ÁO",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐỒ MẶC NGOÀI",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "QUẦN",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐẦM VÀ CHÂN VÁY",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PHỤ KIỆN",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SẢN PHẨM CHỐNG NẮNG",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐỒ MẶC TRONG VÀ ĐỒ LÓT",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐỒ MẶC NHÀ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐỒ BẦU",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ÁO",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐỒ MẶC NGOÀI",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "QUẦN",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐẦM VÀ CHÂN VÁY",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PHỤ KIỆN",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SẢN PHẨM CHỐNG NẮNG",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐỒ MẶC TRONG VÀ ĐỒ LÓT",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ĐỒ MẶC NHÀ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "EM BÉ (0-1 TUỔI)",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            //
                            width: 375,
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "TRẺ NHỎ (6 THÁNG -5 NĂM)",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Màu nền của Container
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Màu của gạch dưới
                                  width: 0.7,

                                  // Độ dày của gạch dưới
                                ),
                              ),
                            )),
                        onTap: () {},
                      ),
                    ],
                  ),
                ]))));
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
