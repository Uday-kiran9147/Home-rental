import 'package:flutter/material.dart';
import 'package:houserental/provider/appstate.dart';
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
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 207, 184, 9)),
        ),
        home: SafeArea(child: MyHomePage()),
        // routes: {
        // '/':(context) => HomeImplement(),
        // HouseDetailScreen.routeName:(context) => HouseDetailScreen(title: ,)
        // },
      ),
    );
  }
}

class HomeImplement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    // IconData icon;
    // if (appState.favorites.contains(pair)) {
    //   icon = Icons.favorite;
    // } else {
    //   icon = Icons.favorite_border;
    // }

    return GridView(
        padding: EdgeInsets.all(15),
        children: appState.homeList
            .map((val) => HomeItem(
                  state: val.state,
                  country: val.country,
                  locality: val.locality,
                  price: val.price,
                  HouseTitle: val.housename,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 4, crossAxisSpacing: 8, maxCrossAxisExtent: 400));
  }
}
