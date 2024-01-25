import 'package:flutter/material.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/widgets/home_Item.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
  });

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
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: appstate.allhouseGetter
            .where((house) => house.category.contains(category))
            .length,
        itemBuilder: (context, index) {
          final house = appstate.allhouseGetter
              .where((house) => house.category.contains(category))
              .toList();
          return HomeItem(
            property: house[index],
          );
        },
      );
    }

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
             Theme.of(context).primaryColor, // Set your desired app bar background color
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow, // Set tab indicator color
            labelColor: Colors.white, // Set selected tab label color
            unselectedLabelColor:
                Colors.black54, // Set unselected tab label color
            tabs: categories.map((e) => Tab(text: e.toString())).toList(),
          ),
          title: const Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: TabBarView(
          children: categories.map((e) => buildListView(e)).toList(),
        ),
      ),
    );
  }
}
