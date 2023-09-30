import 'package:flutter/material.dart';
import 'package:houserental/screens/account_screen.dart';
import 'package:houserental/screens/categoty_screen.dart';
import 'package:houserental/screens/himpl.dart';
import 'package:houserental/screens/renthouse_screen.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../provider/appstate.dart';
import 'favourites_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  bool isloading = false;
  bool isinit = true;

  @override
  void didChangeDependencies() {
    if (isinit) {
      setState(() {
        isloading = true;
      });
      Provider.of<MyAppState>(context).fetechHouses().then((_) {
        setState(() {
          isloading = false;
        });
      });
    }
    isinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const HomeImplement();
        break;
      case 1:
        page = const CategoryScreen();
        break;
      case 2:
        page = const FavoritesPage();
        break;
      case 3:
        page = const AccountScreen();
        break;
      case 4:
        page = const RentHouses();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      appBar: selectedIndex == 0
          ? AppBar(
              backgroundColor: Theme.of(context).primaryColor, // Set a background color
              elevation: 2, // Add a subtle shadow
              title: const Row(
                children: [
                  Text(
                    'Home Rental',
                    style: TextStyle(
                      color: Colors.white, // Text color is white
                      fontSize: 24, // Increase font size
                      fontWeight: FontWeight.bold, // Add bold font weight
                    ),
                  ),
                  SizedBox(width: 16), // Add spacing
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 32, // Increase icon size
                  ),
                  onPressed: () {
                    // Add functionality to add a new house here.
                  },
                ),
                const SizedBox(width: 16), // Add spacing
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    size: 32, // Increase icon size
                  ),
                  onPressed: () {
                    // Add functionality to show notifications here.
                  },
                ),
              ],
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar on narrow screens.
            return Column(
              children: [
                Expanded(child: page),
                BottomNavigationBar(
                  backgroundColor: Colors.amberAccent,
                  showUnselectedLabels: true,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Theme.of(context).primaryColor,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.category),
                      label: 'Categories',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorites',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      label: 'Account',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.upload_outlined),
                      label: 'Rent a House',
                    ),
                  ],
                  currentIndex: selectedIndex,
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ],
            );
          } else {
            return Row(
              children: [
                NavigationRail(
                  // backgroundColor: Colors.white,
                  extended: constraints.maxWidth >= 600,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.category),
                      label: Text('Categories'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.account_circle),
                      label: Text('Account'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.upload_outlined),
                      label: Text('Rent a House'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
                Expanded(child: page),
              ],
            );
          }
        },
      ),
    );
  }
}

class BadgeCustom extends StatelessWidget {
  const BadgeCustom({
    super.key,
    required this.appstate,
  });

  final MyAppState appstate;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
        badgeStyle: const badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          elevation: 0,
        ),
        position: badges.BadgePosition.topEnd(),
        showBadge: true,
        badgeAnimation: const badges.BadgeAnimation.scale(),
        badgeContent: Text('${appstate.favouritelistGetter.length}'),
        child: const Icon(Icons.favorite));
  }
}
