import 'package:flutter/material.dart';
import 'package:instaui/Screen/TabScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text("Instagram"),
              pinned: true,
              floating: true,

              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 150,
                      width: 100,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Photo',
                  ),
                  Tab(
                    text: 'video',
                  )
                ],
                controller: _tabController,
              ),
            ),
          ];
        }),
        body: TabBarView(controller: _tabController, children: [
          TabScreen(),
          TabScreen(),
        ]),
      ),
    ));
  }
}
