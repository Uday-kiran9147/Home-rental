import 'package:flutter/material.dart';

import 'package:houserental/widgets/forms/filldetails.dart';
import 'package:provider/provider.dart';

import '../provider/appstate.dart';

class RentHouses extends StatefulWidget {
  const RentHouses({super.key});
  static const routeName = 'rent-house';

  @override
  State<RentHouses> createState() => _RentHousesState();
}

class _RentHousesState extends State<RentHouses> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    return Scaffold(
        body: Column(children: [
      Container(
          height: 80,
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, RentHouses.routeName),
            child: Text('Fill house details'),
          )),
      Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: appState.allhouseGetter.length,
            itemBuilder: (context, index) => Card(
                  child: Text(
                      appState.allhouseGetter[index].propertyid.toString()),
                )),
      )
    ]));
  }
}

// class House {
//   final String name;
//   final List<String> categories;

//   House({required this.name, required this.categories});
// }

// List<House> houses = [
//   House(name: 'House A', categories: ['Category 1', 'Category 2']),
//   House(name: 'House B', categories: ['Category 2', 'Category 3']),
//   House(name: 'House C', categories: ['Category 1']),
//   House(name: 'House D', categories: ['Category 3']),
// ];

// class MHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<String> categories = getCategories();

//     return DefaultTabController(
//       length: categories.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Houses by Category'),
//           bottom: TabBar(
//             tabs: categories.map((category) => Tab(text: category)).toList(),
//           ),
//         ),
//         body: TabBarView(
//           children: categories.map((category) => buildListView(category)).toList(),
//         ),
//       ),
//     );
//   }

//   Widget buildListView(String category) {
//     return ListView.builder(
//       itemCount: houses.where((house) => house.categories.contains(category)).length,
//       itemBuilder: (context, index) {
//         final house = houses.where((house) => house.categories.contains(category)).toList()[index];
//         return ListTile(
//           title: Text(house.name),
//         );
//       },
//     );
//   }

//   List<String> getCategories() {
//     Set<String> categories = {};
//     for (var house in houses) {
//       categories.addAll(house.categories);
//     }
//     return categories.toList();
//   }
// }
