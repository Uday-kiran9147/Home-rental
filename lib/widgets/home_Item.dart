// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:houserental/screens/house_detail_screen.dart';

import '../models/property.dart';
import '../provider/appstate.dart';

class HomeItem extends StatefulWidget {
  final HouseProperty property;
  const HomeItem({
    Key? key,
    required this.property,
  }) : super(key: key);
  // const HomeItem({super.key});
  // String? propertyid;
  // String? owner;
  // String? housetitle;
  // List<dynamic>? photos;
  // double? price;
  // Address? address;
  // String? checkintime;
  // String? checkouttime;
  // double? cleaningfee;
  // int? bedcount;
  // List<dynamic>? category;
  // List<dynamic>? features;
  // HomeItem({
  //   Key? key,
  //   required this.propertyid,
  //   required this.owner,
  //   required this.housetitle,
  //   required this.photos,
  //   required this.price,
  //   required this.address,
  //   required this.checkintime,
  //   required this.checkouttime,
  //   required this.cleaningfee,
  //   required this.bedcount,
  //   required this.category,
  //   required this.features,
  // }) : super(key: key);
  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    HouseProperty selectedHouse = appState.allhouseGetter.firstWhere(
      (element) => element.propertyid == widget.property.propertyid,
    );

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HouseDetailScreen.routeName,
            arguments: selectedHouse.propertyid);
      },
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(15),
        //   border: Border.all(
        //     color: Color.fromARGB(255, 132, 101, 27),
        //     width: 1.0, // sets the width of the border to 1 pixel
        //   ),
        // ),
        margin: const EdgeInsets.all(8),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Card(
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Image.network(
                    '${widget.property.photos[0]}',
                    fit: BoxFit.fill,
                  ),
                ),
                // height: MediaQuery.of(context).size.height * 0.2
              ),
            ),
            Text(widget.property.housetitle.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 47, 42, 42),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.property.price.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).hintColor,
                    )),
                IconButton(
                    onPressed: () {
                      appState.toggleFavorite(selectedHouse);
                    },
                    icon: appState
                            .isFavourite(selectedHouse.propertyid.toString())
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ))
              ],
            ),
            Text(
                "${widget.property.address.country}, ${widget.property.address.state}, ${widget.property.address.city}, ${widget.property.address.zipcode}",
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
