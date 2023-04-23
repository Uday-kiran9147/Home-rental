import 'package:flutter/material.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/widgets/home_Item.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<MyAppState>(context);
    List<String> categories = appstate.getCategories();

    Widget buildListView(String category) {
      //  final length=appstate.allhouseGetter.where((house) => house.category.contains(category)).length;
      final house = appstate.allhouseGetter
          .where((house) => house.category.contains(category))
          .toList();
      return GridView(
          padding: EdgeInsets.all(15),
          children: house
              .map((val) => HomeItem(
                  propertyid: val.propertyid,
                  owner: 'uday',
                  housetitle: val.housetitle,
                  photos: val.photos,
                  price: val.price,
                  address: val.address,
                  checkintime: val.checkintime,
                  checkouttime: val.checkouttime,
                  cleaningfee: val.cleaningfee,
                  bedcount: val.bedcount,
                  category: val.category,
                  features: val.features))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 4,
              crossAxisSpacing: 8,
              maxCrossAxisExtent: 400));
    }

    return DefaultTabController(initialIndex: 2,
        // animationDuration: Duration(),
        length: appstate.getCategories().length,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                  isScrollable: true,
                  dividerColor: Colors.amber,
                  labelColor: Colors.grey,
                  tabs: categories.map((e) => Tab(text: e)).toList())),
          body: TabBarView(
              children: categories.map((e) => buildListView(e)).toList()),
        ));
  }
}
