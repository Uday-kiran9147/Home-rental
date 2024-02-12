import 'dart:math';

import 'package:flutter/material.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/widgets/custom_image.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';
import '../utils/pricebeautify.dart';

class BookingCardWidget extends StatelessWidget {
  BookingCardWidget({super.key, required this.booking});
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context, listen: false);
    final currentHouse = appState.allhouseGetter
        .firstWhere((e) => booking.houseid!.contains(e.propertyid));
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking Date: ${DateFormat.yMd().format(DateTime.parse(DateTime.now().toString()))}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Check-in: ${DateFormat.yMd().format(DateTime.parse(booking.checkin.toString()))}',
                ),
                Text(
                  'Check-out: ${DateFormat.yMd().format(DateTime.parse(booking.checkout.toString()))}',
                ),
                Text(
                  'Guests: ${booking.guests}',
                ),
                Text(
                  'Days: ${booking.numberofdays}',
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Price: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    dataTablepriceBeautify(booking.bookingprice.toString()),
                  ],
                ),
              ],
            ),
            Container(
              height: 130,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // border:
                //     Border.all( width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: CustomImageView(
                  imagePath: currentHouse.photos[0],
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
