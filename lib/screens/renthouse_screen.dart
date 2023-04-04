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
/* 



 InkWell(
      onTap: () {
        // selectedHome(context);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
                    child: Stack(
                      children: [
                        Center(
                            child: Container(
                          child: Image.network(
                            'https://a0.muscache.com/im/pictures/miso/Hosting-605371928419351152/original/8711dc45-edaa-452e-8502-628f72784757.jpeg?im_w=960',
                            fit: BoxFit.cover,
                          ),
                        )),
                        IconButton(
                            onPressed: () {
                              // appState.toggleFavorite(selectedHouse);
                            },
                            icon: appState.isFavourite(appState.allhouseGetter[index].propertyid.toString())
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border))
                      ],
                    )
                    //  Image.network(
                    //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaeuzwxd3_92sIUBtn-XwY3IW54qYJ5rh5Wg&usqp=CAU',
                    //   height: 250,
                    //   width: double.infinity,
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                color: Colors.transparent,
                // height: MediaQuery.of(context).size.height * 0.2
              ),
            ),
            Text(appState.allhouseGetter[index].housetitle.toString()),
            Text(appState.allhouseGetter[index]. price.toString()),
            Text("${appState.allhouseGetter[index].address!.country}, ${appState.allhouseGetter[index].address!.state}, ${appState.allhouseGetter[index].address!.zipcode}"),
          ],
        ),
      ),
    )
 */