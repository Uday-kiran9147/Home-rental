import 'package:flutter/material.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/widgets/home_Item.dart';
import 'package:provider/provider.dart';

import '../../widgets/searchbar.dart';

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
    Set<String> categories = appstate.getCategories();

    Widget buildListView(String category) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 450,
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
              Colors.white, // Set your desired app bar background color
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.black, // Set tab indicator color
            labelColor: Colors.pink, // Set selected tab label color
            unselectedLabelColor:
                Colors.black54, // Set unselected tab label color
            tabs: categories.map((e) => Tab(text: e.toString())).toList(),
          ),
          actions: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: Icon(Icons.sort))
          ],
          title: InkWell(
            onTap: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            child: Container(
              padding: EdgeInsets.zero,
              height: AppBar().preferredSize.height - 10,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(
                //   color: Colors.black,
                //   width: 1.0,
                // )
              ),
              child: Row(
                children: [
                  Expanded(child: Icon(Icons.search)),
                  Expanded(
                      flex: 3,
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Where to?\n',
                            style: TextStyle(
                              color: Colors.black, // Text color is white
                              fontSize: 13, // Increase font size
                              fontWeight:
                                  FontWeight.w500, // Add bold font weight
                            ),
                          ),
                          TextSpan(
                            text: 'Anywhere • Any week • Add guests',
                            style: TextStyle(
                              color: Colors.black, // Text color is white
                              fontSize: 9, // Increase font size
                              fontWeight:
                                  FontWeight.w500, // Add bold font weight
                            ),
                          ),
                        ]),
                      )),
                  SizedBox(width: 16), // Add spacing
                ],
              ),
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
