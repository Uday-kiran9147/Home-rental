import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 11,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
            isScrollable: true,
            dividerColor: Colors.amber,
            labelColor: Colors.grey,
            tabs: [
              _tabbar("home", Icon(Icons.home)),
              _tabbar("pool", Icon(Icons.pool)),
              _tabbar("Beaches", Icon(Icons.beach_access)),
              _tabbar("Lakefront", Icon(Icons.waterfall_chart)),
              _tabbar("windmill", Icon(Icons.wind_power)),
              _tabbar("historical home", Icon(Icons.history_edu)),
              _tabbar("private home", Icon(Icons.private_connectivity)),
              _tabbar("National Park", Icon(Icons.park)),
              _tabbar("Trending", Icon(Icons.trending_up)),
              _tabbar("Island", Icon(Icons.landscape)),
              _tabbar("Camping", Icon(Icons.home_mini)),
            ],
          )),
          body: TabBarView(children: [
            _tabbar("home", Icon(Icons.home)),
            _tabbar("pool", Icon(Icons.pool)),
            _tabbar("Beach", Icon(Icons.beach_access)),
            _tabbar("Lakefront", Icon(Icons.waterfall_chart)),
            _tabbar("windmills", Icon(Icons.wind_power)),
            _tabbar("historical home", Icon(Icons.history_edu)),
            _tabbar("private home", Icon(Icons.private_connectivity)),
            _tabbar("National Park", Icon(Icons.park)),
            _tabbar("Trending", Icon(Icons.trending_up)),
            _tabbar("Island", Icon(Icons.landscape)),
            _tabbar("Camping", Icon(Icons.home_mini)),
          ]),
        ));
  }

  Tab _tabbar(String place, Icon usericon) {
    return Tab(text: "$place", icon: usericon);
  }

  Widget _tab() {
    return TabBar(
        isScrollable: true,
        dividerColor: Colors.amber,
        labelColor: Colors.grey,
        tabs: [
          _tabbar("home", Icon(Icons.home)),
          _tabbar("pools", Icon(Icons.pool)),
          _tabbar("Beach", Icon(Icons.beach_access)),
          // _tabbar("Lakefront", Icon(Icons.waterfall_chart)),
          // _tabbar("windmills", Icon(Icons.wind_power)),
          // _tabbar("historical homes", Icon(Icons.history_edu)),
          // _tabbar("countryside", Icon(Icons.home_max)),
          // _tabbar("private homes", Icon(Icons.private_connectivity)),
          // _tabbar("National Parks", Icon(Icons.park)),
          // _tabbar("Trending", Icon(Icons.trending_up)),
          // _tabbar("Tropical", Icon(Icons.trip_origin)),
          // _tabbar("Islands", Icon(Icons.landscape)),
          // _tabbar("Mansions", Icon(Icons.trip_origin)),
          // _tabbar("Camping", Icon(Icons.home_mini)),
          // _tabbar("Camping", Icon(Icons.home_mini)),
        ]);
  }
}
