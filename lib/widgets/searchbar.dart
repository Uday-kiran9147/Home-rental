import 'package:flutter/material.dart';
import 'package:houserental/models/property.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/widgets/home_Item.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [];


// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = ''; // clear the search text
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildSuggestions(BuildContext context) {
    // List<String> matchQuery = [];
    // for (var fruit in searchTerms) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(fruit);
    //   }
    // }
    return buildResults(context); // I wanted suggestions to be same as results,refer below commented code.
    // return ListView.builder(
    //   itemCount: matchQuery.length,
    //   itemBuilder: (context, index) {
    //     var result = matchQuery[index];
    //     return ListTile(
    //       title: Text(result),
    //     );
    //   },
    // );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildResults(BuildContext context) {
    MyAppState appState = Provider.of<MyAppState>(context);
    searchTerms = appState.allhouseGetter.map((e) => e.housetitle).toList();
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return  GridView(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        maxCrossAxisExtent: 400,
      ),
      children: appState.search_Houes(query).map((val) {
        return HomeItem(
          property: HouseProperty(
            maxguests: val.maxguests,
            propertyid: val.propertyid,
            ownerId: 'uday',
            housetitle: val.housetitle,
            photos: val.photos,
            price: val.price,
            address: val.address,
            checkintime: val.checkintime,
            checkouttime: val.checkouttime,
            cleaningfee: val.cleaningfee,
            bedcount: val.bedcount,
            category: val.category,
            features: val.features,
            createdAt: val.createdAt,
            updatedAt: val.updatedAt,
          ),
        );
      }).toList(),
    );
  }
}
