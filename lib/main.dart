import 'package:flutter/material.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/screens/house_detail_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'widgets/home_Item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MyAppState())],
      child: MaterialApp(
        title: 'Home-Rent',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 207, 184, 9)),
        ),
        home: SafeArea(child: MyHomePage()),
        routes: {
        // '/':(context) => HomeImplement(),
        HouseDetailScreen.routeName:(context) => HouseDetailScreen()
        },
      ),
    );
  }
}

class HomeImplement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // IconData icon;
    // if (appState.favorites.contains(pair)) {
    //   icon = Icons.favorite;
    // } else {
    //   icon = Icons.favorite_border;
    // }

    return GridView(
        padding: EdgeInsets.all(15),
        children: appState.allhouseGetter
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
                houserules: val.houserules))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 4, crossAxisSpacing: 8, maxCrossAxisExtent: 400));
  }
}
