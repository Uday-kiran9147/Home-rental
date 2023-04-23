import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/appstate.dart';

class RentHouses extends StatefulWidget {
  const RentHouses({super.key});
  static const routeName = 'rent-house';

  @override
  State<RentHouses> createState() => _RentHousesState();
}

class _RentHousesState extends State<RentHouses> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    return Scaffold(
        body: Column(children: [
      Container(
          height: 80,
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, RentHouses.routeName),
            child: Text('Fill house details'),
          )),
      Expanded(
        child: ListView.builder(
            // shrinkWrap: true,
            itemCount: appState.allhouseGetter.length,
            itemBuilder: (context, index) => Card(
                  shadowColor: Colors.red,
                  color: Colors.grey.shade200,
                  elevation: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage: NetworkImage(
                                appState.allhouseGetter[index].photos[0]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "${appState.allhouseGetter[index].housetitle} -\$${appState.allhouseGetter[index].price}",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
      )
    ]));
  }
}
