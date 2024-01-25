// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:houserental/screens/house_detail_screen.dart';

import '../models/property.dart';
import '../provider/appstate.dart';
import 'custom_image.dart';

class HomeItem extends StatefulWidget {
  final HouseProperty property;
  const HomeItem({
    Key? key,
    required this.property,
  }) : super(key: key);
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
      child: Stack(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(15),
            //   border: Border.all(
            //     color: Color.fromARGB(255, 132, 101, 27),
            //     width: 1.0, // sets the width of the border to 1 pixel
            //   ),
            // ),
            margin: const EdgeInsets.all(5),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: CustomImageView(imagePath: 
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
          Positioned(
            top: 10,
            right: 20,
            child: IconButton(
                onPressed: () {
                  appState.toggleFavorite(selectedHouse);
                },
                icon: appState.isFavourite(selectedHouse.propertyid.toString())
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      )),
          )
        ],
      ),
    );
  }
}
