import 'package:flutter/material.dart';

class Places extends StatefulWidget {
  const Places({super.key});

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 15,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.15, child:
                  _tab()),
          Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                _tabBarView(context),
                // EditableText(
                //     controller: _controller,
                //     focusNode: FocusNode(),
                //     style: TextStyle(color: Colors.purple),
                //     cursorColor: Colors.deepOrange,
                //     backgroundCursorColor: Colors.red),
                _tabBarView(context),
                _tabBarView(context),

                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User Body"),
                ),
                Container(
                  child: Text("User last"),
                ),
                //   ]),
                // ),
              ],
            ),
          )
        ]));
  }

  Widget _tabbar(String place, Icon usericon) {
    return Tab(text: "$place", icon: usericon);
  }

  Widget _tab() {
    return TabBar(
        isScrollable: true,
        dividerColor: Colors.amber,
        labelColor: Colors.grey,
        tabs: [
          _tabbar("home", Icon(Icons.home)),
          _tabbar("pools", Icon(Icons.pool)),
          _tabbar("Beaches", Icon(Icons.beach_access)),
          _tabbar("Lakefront", Icon(Icons.waterfall_chart)),
          _tabbar("windmills", Icon(Icons.wind_power)),
          _tabbar("historical homes", Icon(Icons.history_edu)),
          _tabbar("countryside", Icon(Icons.home_max)),
          _tabbar("private homes", Icon(Icons.private_connectivity)),
          _tabbar("National Parks", Icon(Icons.park)),
          _tabbar("Trending", Icon(Icons.trending_up)),
          _tabbar("Tropical", Icon(Icons.trip_origin)),
          _tabbar("Islands", Icon(Icons.landscape)),
          _tabbar("Mansions", Icon(Icons.trip_origin)),
          _tabbar("Camping", Icon(Icons.home_mini)),
          _tabbar("Camping", Icon(Icons.home_mini)),
        ]);
  }
}

Widget _tabBarView(BuildContext context) {
  return GridView.builder(
    padding: EdgeInsets.all(4),
    clipBehavior: Clip.antiAlias,
    // physics: NeverScrollableScrollPhysics(),
    shrinkWrap: false,
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 400,
      // crossAxisCount: 4,
      childAspectRatio: 1,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
    ),
    itemCount: 40,
    itemBuilder: (context, index) {
      return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border.all(width: 0.1)),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaeuzwxd3_92sIUBtn-XwY3IW54qYJ5rh5Wg&usqp=CAU',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                color: Colors.transparent,
                // height: MediaQuery.of(context).size.height * 0.2
              ),
            ),
            Text('location'),
            Text('\$3,45,000/-')
          ],
        ),
      );
    },
  );
}
