import 'package:flutter/material.dart';
import 'package:houserental/data/data.dart';
import 'package:houserental/widgets/home_Item.dart';
import 'package:provider/provider.dart';

import '../../provider/appstate.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.read<MyAppState>();

    if (appState.favouritelistGetter.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 15,top: 60),
        child: Text(
          'Wishlist',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      Expanded(
          //we can use GridView as map as used previously in homeScreen
          child: GridView.builder(padding: EdgeInsets.zero,
              itemCount: appState.favouritelistGetter.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400),
              itemBuilder: (context, index) {
                return HomeItem(
                    property: HouseProperty(
                        createdAt:
                            appState.favouritelistGetter[index].createdAt,
                        updatedAt:
                            appState.favouritelistGetter[index].updatedAt,
                        propertyid:
                            appState.favouritelistGetter[index].propertyid,
                        maxguests:
                            appState.favouritelistGetter[index].maxguests,
                        ownerId: appState.favouritelistGetter[index].ownerId,
                        housetitle:
                            appState.favouritelistGetter[index].housetitle,
                        photos: appState.favouritelistGetter[index].photos,
                        price: appState.favouritelistGetter[index].price,
                        address: appState.favouritelistGetter[index].address,
                        checkintime:
                            appState.favouritelistGetter[index].checkintime,
                        checkouttime:
                            appState.favouritelistGetter[index].checkouttime,
                        cleaningfee:
                            appState.favouritelistGetter[index].cleaningfee,
                        bedcount: appState.favouritelistGetter[index].bedcount,
                        category: appState.favouritelistGetter[index].category,
                        features:
                            appState.favouritelistGetter[index].features));
              })
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
          ),
    ]);
  }
}
