import 'package:flutter/material.dart';
import 'package:houserental/screens/account_screen.dart';
import 'package:provider/provider.dart';

import '../provider/booking.dart';

enum BookingFilter { current, past, all, saperate }

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({
    super.key,
  });

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  BookingFilter filter = BookingFilter.saperate;

  @override
  void initState() {
    Provider.of<BookingProvider>(context, listen: false).filterBookings();
    super.initState();
  }

  String getFilerName() {
    switch (filter) {
      case BookingFilter.all:
        return 'All Bookings';
      case BookingFilter.current:
        return 'Current Bookings';
      case BookingFilter.past:
        return ' Past Bookings';
      case BookingFilter.saperate:
        return 'Current Bookings';
      default:
        return 'Bookings';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookingState = Provider.of<BookingProvider>(context);
    final String currentFilter = getFilerName();
    final bookings = filter == BookingFilter.current
        ? bookingState.currentBookings
        : filter == BookingFilter.past
            ? bookingState.pastBookings
            : bookingState.bookings;
    return Scaffold(
      appBar: AppBar(title: const Text('Bookings'), actions: <Widget>[
        PopupMenuButton(
          onSelected: (BookingFilter selectedValue) {
            setState(() {
              filter = selectedValue;
            });
          },
          icon: Icon(
            Icons.more_vert,
          ),
          itemBuilder: (_) => [
            PopupMenuItem(
              child: Text('Show All '),
              value: BookingFilter.all,
            ),
            PopupMenuItem(
              child: Text('Only current Bookings'),
              value: BookingFilter.current,
            ),
            PopupMenuItem(
              child: Text('Only Past Bookings'),
              value: BookingFilter.past,
            ),
          ],
        ),
      ]),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileHeadLine(title: '\t $currentFilter'),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network(
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    'https://zenatta.com/wp-content/uploads/2020/08/bookings-256.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                return BookingCardWidget(
                  booking: bookings[index],
                );
              }),
          filter == BookingFilter.saperate
              ? Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProfileHeadLine(title: '\tPast Bookings'),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: bookingState.pastBookings.length,
                      itemBuilder: (context, index) => BookingCardWidget(
                        booking: bookingState.pastBookings[index],
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
