import 'package:flutter/material.dart';

import 'package:houserental/widgets/forms/filldetails.dart';
import 'package:provider/provider.dart';

import '../provider/appstate.dart';

class RentHouses extends StatefulWidget {
  const RentHouses({super.key});

  @override
  State<RentHouses> createState() => _RentHousesState();
}

class _RentHousesState extends State<RentHouses> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FillHouseDetails(),
                    ));
              },
              child: Text('fill details')),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: appState.allhouseGetter.length,
              itemBuilder: (context, index) => Card(
                    child: Text(
                        appState.allhouseGetter[index].propertyid.toString()),
                  )
                  ),
        )
      ]),
    );
  }
}



