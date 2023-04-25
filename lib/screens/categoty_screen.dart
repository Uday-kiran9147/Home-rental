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
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400, mainAxisSpacing: 4, crossAxisSpacing: 8),
        itemCount: appstate.allhouseGetter
            .where((house) => house.category.contains(category))
            .length,
        itemBuilder: (context, index) {
          final house = appstate.allhouseGetter
              .where((house) => house.category.contains(category))
              .toList();
          return HomeItem(
              propertyid: house[index].propertyid,
              owner: house[index].owner,
              housetitle: house[index].housetitle,
              photos: house[index].photos,
              price: house[index].price,
              address: house[index].address,
              checkintime: house[index].checkintime,
              checkouttime: house[index].checkouttime,
              cleaningfee: house[index].cleaningfee,
              bedcount: house[index].bedcount,
              category: house[index].category,
              features: house[index].features);
        },
      );
    }

    return DefaultTabController(
        length: appstate.getCategories().length,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                  isScrollable: true,
                  dividerColor: Colors.amber,
                  labelColor: Colors.grey,
                  tabs: categories
                      .map((e) => Tab(
                            text: e.toString(),
                          ))
                      .toList())),
          body: TabBarView(
              children: categories.map((e) => buildListView(e)).toList()),
        ));
  }
}
