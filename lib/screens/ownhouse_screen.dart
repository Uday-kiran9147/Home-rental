import 'package:flutter/material.dart';
import 'package:houserental/data/data.dart';
import 'package:houserental/widgets/home_Item.dart';
import 'package:provider/provider.dart';

import '../provider/appstate.dart';

class OwnHousePage extends StatefulWidget {
  const OwnHousePage({super.key});
  static const ownHouseRoute = '/ownhouse';

  @override
  State<OwnHousePage> createState() => _OwnHousePageState();
}

class _OwnHousePageState extends State<OwnHousePage> {
  @override
  void initState() {
    // Provider.of(listen: false)<MyAppState>.getownHouseList();
    Provider.of<MyAppState>(context, listen: false).getownHouseList();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.ownHouseGetter.isEmpty) {
      return Scaffold(appBar: AppBar(backgroundColor: Colors.red,),
        body: const Center(
          child: Text('No Properties yet.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Properties'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // const ProfileHeadLine(title: 'My Properties'),
        Center(
          child: Text('You have '
              '${appState.ownHouseGetter.length} properties'),
        ),
        Expanded(
            //we can use GridView as map as used previously in homeScreen
            child: GridView.builder(
                itemCount: appState.ownHouseGetter.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400),
                itemBuilder: (context, index) {
                  return HomeItem(
                      property: HouseProperty(
                          createdAt: appState.ownHouseGetter[index].createdAt,
                          updatedAt: appState.ownHouseGetter[index].updatedAt,
                          propertyid: appState.ownHouseGetter[index].propertyid,
                          maxguests: appState.ownHouseGetter[index].maxguests,
                          ownerId: appState.ownHouseGetter[index].ownerId,
                          housetitle: appState.ownHouseGetter[index].housetitle,
                          photos: appState.ownHouseGetter[index].photos,
                          price: appState.ownHouseGetter[index].price,
                          address: appState.ownHouseGetter[index].address,
                          checkintime:
                              appState.ownHouseGetter[index].checkintime,
                          checkouttime:
                              appState.ownHouseGetter[index].checkouttime,
                          cleaningfee:
                              appState.ownHouseGetter[index].cleaningfee,
                          bedcount: appState.ownHouseGetter[index].bedcount,
                          category: appState.ownHouseGetter[index].category,
                          features: appState.ownHouseGetter[index].features));
                })),
      ]),
    );
  }
}
