// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:houserental/screens/house_detail_screen.dart';
import 'package:provider/provider.dart';

import '../provider/appstate.dart';

class HomeItem extends StatelessWidget {
  // const HomeItem({super.key});
  String state;
  String country;
  String locality;
  int price;
  String HouseTitle;
  HomeItem({
    Key? key,
    required this.state,
    required this.country,
    required this.locality,
    required this.price,
    required this.HouseTitle,
  }) : super(key: key);

  void selectedHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context)=>HouseDetailScreen(title: HouseTitle, country: country, state: state, locality: locality, price: price)));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return InkWell(
      onTap: () {
        selectedHome(context);
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
                    child: Center(child: Text("Picture Here"))
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
            Text(HouseTitle),
            Text(price.toString()),
            Text("${state}, ${country}, ${locality}"),
          ],
        ),
      ),
    );
  }
}
