
  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/property.dart';
import '../provider/appstate.dart';
import '../screens/payment_detail_screen.dart';

Container bottomNavigation(MyAppState appstate, HouseProperty selectedHouse, BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                  onPressed: () {
                    // appState.toggleFavorite(selectedHouse);
                    appstate.toggleFavorite(selectedHouse);
                  },
                  icon: appstate
                          .isFavourite(selectedHouse.propertyid.toString())
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(Icons.favorite_border, color: Colors.red))),
          SizedBox(width: 20),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, HousePaymentDetailsScreen.routeName,
                    arguments: selectedHouse.propertyid);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Reserve',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }