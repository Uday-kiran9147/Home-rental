import 'package:flutter/material.dart';
import 'package:houserental/screens/account_screen.dart';
import 'package:provider/provider.dart';

import '../provider/booking.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bookingState = Provider.of<BookingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileHeadLine(title: '  Current Bookings'),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: bookingState.currentBookings.length,
            itemBuilder: (context, index) {
              // if (bookingState.isCurrentBooking(DateTime.parse(
              //     bookingState.currentBookings[index].checkout!))) {
                return BookingCardWidget(
                  booking: bookingState.currentBookings[index],
                );
              }
            // },
          ),
          const ProfileHeadLine(title: '  Past Bookings'),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: bookingState.pastBookings.length,
            itemBuilder: (context, index) => BookingCardWidget(
              booking: bookingState.pastBookings[index],
            ),
          ),
        ],
      ),
    );
  }
}
