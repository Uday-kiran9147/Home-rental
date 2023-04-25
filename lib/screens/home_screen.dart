import 'package:flutter/material.dart';
import 'package:houserental/screens/account_screen.dart';
import 'package:houserental/screens/categoty_screen.dart';
import 'package:houserental/screens/renthouse_screen.dart';
import 'package:houserental/services/apiservice.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../provider/appstate.dart';
import '../widgets/home_Item.dart';
import 'favourites_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<MyAppState>(context);
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
      case 4:
        page = RentHouses();
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
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      // sets the background color of the `BottomNavigationBar`
                      canvasColor: Colors.white,
                      // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                      // primaryColor: Colors.red,
                      // textTheme: Theme.of(context).textTheme.copyWith(
                      // caption: new TextStyle(color: Colors.yellow))
                    ),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.amberAccent,
                      unselectedItemColor: Colors.grey,
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
                            label: ' Account'),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.cloud_upload_outlined,
                            ),
                            label: 'Rent a House')
                      ],
                      currentIndex: selectedIndex,
                      onTap: (value) {
                        setState(() {
                          selectedIndex = value;
                        });
                      },
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container(
              // height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
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
                            icon: BadgeCustom(appstate: appstate),
                            label: Text('Favorites')),
                        NavigationRailDestination(
                            icon: Icon(Icons.account_circle_rounded),
                            label: Text('Account')),
                        NavigationRailDestination(
                            icon: Icon(Icons.cloud_upload_outlined),
                            label: Text('Rent a House'))
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
              ),
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
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          elevation: 0,
        ),
        position: badges.BadgePosition.topEnd(),
        showBadge: true,
        badgeAnimation: badges.BadgeAnimation.scale(),
        badgeContent: Text('${appstate.favouritelistGetter.length}'),
        child: Icon(Icons.favorite));
  }
}

class HomeImplement extends StatefulWidget {
  @override
  State<HomeImplement> createState() => _HomeImplementState();
}

class _HomeImplementState extends State<HomeImplement> {
  String search = '';
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
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<MyAppState>(context, listen: false).fetechHouses();
  // }

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<MyAppState>(context);
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: TextField(
            onChanged: (value) {
              setState(() {
                search = value;
              });
            },
            decoration: InputDecoration(label: Text('search')),
          ),
        ),
        (appState.search_Houes(search).length > 0)
            ? Expanded(
                child: GridView(
                    padding: EdgeInsets.all(15),
                    children: appState
                        .search_Houes(search)
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
                            features: val.features))
                        .toList(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 8,
                        maxCrossAxisExtent: 400)),
              )
            : Center(child: Text("No houses Found"))
      ],
    );
  }
}
