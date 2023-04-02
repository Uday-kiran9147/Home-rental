// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:houserental/models/dummy.dart';
import 'package:houserental/screens/house_detail_screen.dart';

import '../models/property.dart';
import '../provider/appstate.dart';

class HomeItem extends StatefulWidget {
  // const HomeItem({super.key});
  String? propertyid;
  String? housetitle;
  List<String>? photos;
  double? price;
  Address? address;
  String? checkintime;
  String? checkouttime;
  int? cleaningfee;
  int? bedcount;
  List<String>? category;
  List<String>? houserules;
  HomeItem({
    Key? key,
    required this.propertyid,
    required this.housetitle,
    required this.photos,
    required this.price,
    required this.address,
    required this.checkintime,
    required this.checkouttime,
    required this.cleaningfee,
    required this.bedcount,
    required this.category,
    required this.houserules,
  }) : super(key: key);
  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  void selectedHome(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HouseDetailScreen(
            id: widget.propertyid.toString(),
            title: widget.housetitle.toString(),
            address: Address(
                country: widget.address!.country,
                state: widget.address!.state,
                zipcode: widget.address!.zipcode,
                street: widget.address!.street),
            price: widget.price as double)));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    HouseProperty selectedHouse = appState.allhouseGetter.firstWhere(
      (element) => element.propertyid == widget.propertyid,
    );

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
                              appState.toggleFavorite(selectedHouse);
                            },
                            icon: appState.isFavourite(
                                    selectedHouse.propertyid.toString())
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
            Text(widget.housetitle.toString()),
            Text(widget.price.toString()),
            Text(
                "${widget.address!.state}, ${widget.address!.country}, ${widget.address!.zipcode}"),
          ],
        ),
      ),
    );
  }
}
