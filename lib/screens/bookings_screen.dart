import 'package:flutter/material.dart';
import 'package:houserental/screens/navScreens/account_screen.dart';
import 'package:provider/provider.dart';

import '../provider/booking.dart';
import '../widgets/booking_card.dart';

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

  String getFilterName() {
    switch (filter) {
      case BookingFilter.all:
        return 'All Bookings';
      case BookingFilter.current:
        return 'Current Bookings';
      case BookingFilter.past:
        return ' Past Bookings';
      default:
        return 'Bookings';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookingState = Provider.of<BookingProvider>(context);
    final String currentFilter = getFilterName();
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
              child: Text('Show All'),
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
      body: ListView(padding: EdgeInsets.all(8.0),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileHeadLine(title: '$currentFilter'),
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
         bookings.isEmpty? Center(child: Image.network('https://cdnl.iconscout.com/lottie/premium/thumb/empty-box-5708298-4748209.gif')): ListView.builder(
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
                    const ProfileHeadLine(title: 'Past Bookings'),
                   bookingState.pastBookings.isEmpty? Center(child: Image.network('https://i.pinimg.com/originals/5d/35/e3/5d35e39988e3a183bdc3a9d2570d20a9.gif')):  ListView.builder(
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
