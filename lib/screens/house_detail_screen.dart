import 'package:flutter/material.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:provider/provider.dart';

class HouseDetailScreen extends StatelessWidget {
  static const routeName = 'house-detail';
  @override
  Widget build(BuildContext context) {
    final houseid = ModalRoute.of(context)!.settings.arguments;
    print(houseid);
    final appstate = Provider.of<MyAppState>(context);
    final selectedHouse = appstate.allhouseGetter.firstWhere(
      (element) => element.propertyid == houseid,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedHouse.housetitle.toString()),
      ),
      body: appstate.allhouseGetter.isEmpty
          ? Center(
              child: Text('No images found.'),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      height: 400,
                      width: 600,
                      padding: EdgeInsets.all(10.0),
                      child: GridView.builder(
                        itemCount: selectedHouse.photos.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image:
                                    NetworkImage(selectedHouse.photos[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      )),
                  Text(
                      '${selectedHouse.address!.country}, ${selectedHouse.address!.state},${selectedHouse.address!.street} ${selectedHouse.address!.zipcode}'),
                  Text(selectedHouse.price.toString().replaceAllMapped(
                      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (match) => '${match[1]},')),
                  Divider(),
                  ElevatedButton(
                    child: Text('Reserve'),
                    onPressed: () {},
                  ),
                  buildContainer(
                    ListView.builder(
                        // shrinkWrap: true,
                        itemCount: selectedHouse.houserules.length,
                        itemBuilder: (context, index) => Card(
                              color: Theme.of(context).primaryColor,
                              child: Text(selectedHouse.houserules[index]),
                            )),
                  ),
                  buildContainer(
                    ListView.builder(
                        // shrinkWrap: true,
                        itemCount: selectedHouse.photos.length,
                        itemBuilder: (context, index) => Card(
                              color: Theme.of(context).primaryColor,
                              child: Text(selectedHouse.photos[index]),
                            )),
                  )
                ],
              ),
            ),
    );
  }

  Widget buildContainer(
    Widget child,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 500,
      child: child,
    );
  }
}
