// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:houserental/screens/house_detail_screen.dart';

import '../models/property.dart';
import '../provider/appstate.dart';

class HomeItem extends StatefulWidget {
  // const HomeItem({super.key});
  String? propertyid;
  String? owner;
  String? housetitle;
  List<dynamic>? photos;
  double? price;
  Address? address;
  String? checkintime;
  String? checkouttime;
  double? cleaningfee;
  int? bedcount;
  List<dynamic>? category;
  List<dynamic>? features;
  HomeItem({
    Key? key,
    required this.propertyid,
    required this.owner,
    required this.housetitle,
    required this.photos,
    required this.price,
    required this.address,
    required this.checkintime,
    required this.checkouttime,
    required this.cleaningfee,
    required this.bedcount,
    required this.category,
    required this.features,
  }) : super(key: key);
  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    HouseProperty selectedHouse = appState.allhouseGetter.firstWhere(
      (element) => element.propertyid == widget.propertyid,
    );

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HouseDetailScreen.routeName,
            arguments: selectedHouse.propertyid);
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
                                ? Icon(Icons.favorite,color: Colors.red,)
                                : Icon(Icons.favorite_border,color: Colors.red,))
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
            Text(widget.housetitle.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 47, 42, 42),
                )),
            Text(widget.price.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).hintColor,
                )),
            Text(
                "${widget.address!.state}, ${widget.address!.country}, ${widget.address!.zipcode}",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).hintColor,
                )),
          ],
        ),
      ),
    );
  }
}
