import 'package:flutter/material.dart';
import 'package:houserental/screens/account_screen.dart';
import 'package:houserental/screens/categoty_screen.dart';

import '../main.dart';
import 'favourites_screen.dart';

class MyHomePage extends StatefulWidget { 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomeImplement();
        break;
      case 1:
        page = CategoryScreen();
        break;
      case 2:
        page = FavoritesPage();
        break;
      case 3:
        page = AccountScreen();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    unselectedItemColor: Colors.black38,
                    selectedItemColor: Theme.of(context).primaryColor,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.category_rounded),
                        label: 'Categories',
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.favorite,
                          ),
                          label: ' Favorites'),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.account_circle_sharp,
                          ),
                          label: ' Account')
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    backgroundColor: Colors.white70,
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.category_rounded),
                        label: Text('Categories '),
                      ),
                      NavigationRailDestination(
                          icon: Icon(Icons.favorite), label: Text('Favorites')),
                      NavigationRailDestination(
                          icon: Icon(Icons.account_circle_rounded),
                          label: Text('Account'))
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
