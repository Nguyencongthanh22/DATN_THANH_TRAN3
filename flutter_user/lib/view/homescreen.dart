import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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
                    // crossAxisAlignment: CrossAxisAlignment.start,
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
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.shopping_cart),
                              onPressed: () async {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.chat_sharp),
                              onPressed: () {},
                            ),
                          ])
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
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
                )
                )
                ));
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
