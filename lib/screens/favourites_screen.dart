import 'package:flutter/material.dart';
import 'package:houserental/widgets/home_Item.dart';
import 'package:provider/provider.dart';

import '../provider/appstate.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {  
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    if (appState.favouritelistGetter.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text('You have '
              '${appState.favouritelistGetter.length} favorites:'),
        ),
        Expanded(

          //we can use GridView as map as used previously in homeScreen
          child: GridView.builder(
            itemCount: appState.favouritelistGetter.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400),
            itemBuilder: (context, index) => HomeItem(
                propertyid: appState.favouritelistGetter[index].propertyid,
                housetitle: appState.favouritelistGetter[index].housetitle,
                photos: appState.favouritelistGetter[index].photos,
                price: appState.favouritelistGetter[index].price,
                address: appState.favouritelistGetter[index].address,
                checkintime: appState.favouritelistGetter[index].checkintime,
                checkouttime: appState.favouritelistGetter[index].checkouttime,
                cleaningfee: appState.favouritelistGetter[index].cleaningfee,
                bedcount: appState.favouritelistGetter[index].bedcount,
                category: appState.favouritelistGetter[index].category,
                houserules: appState.favouritelistGetter[index].houserules))
          // Make better use of wide windows with a grid.
          // child: GridView(
          //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 400,
          //     childAspectRatio: 400 / 80,
          //   ),
          //   children: [
          //     for (var pair in appState.favoriteslist)

          // ListTile(
          //   leading: IconButton(
          //     icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
          //     color: theme.colorScheme.primary,
          //     onPressed: () {
          //       appState.removeFavorite(pair);
          //     },
          //   ),
          // ),
          //   ],
          // ),
        ),]
    );
  }
}
