import 'package:flutter/material.dart';
import '../models/booking.dart';

enum BookingStatus { current, past }

class BookingProvider with ChangeNotifier {
  final List<Booking> _currentBookingList = [];
  final List<Booking> _pastBookingList = [];
  List<Booking> get currentBookings=>_currentBookingList;
  List<Booking> get pastBookings=>_pastBookingList;

  bool isCurrentBooking(DateTime checkOut) {
    DateTime currentDate = DateTime.now();
    DateTime checkoutDate = DateTime.parse(checkOut.toString());

    return checkoutDate.isAfter(currentDate);
  }
  void bookhouse(Booking booking) async{
    _currentBookingList.add(booking);
  //  await ApiService.bookhouse(booking);
    notifyListeners();
  }

  Future<void> fetchbookings() async {
    // ApiService.fetchbookings();
    notifyListeners();
  }

  List<Booking> get bookinglistgetter {
    return [..._currentBookingList];
  }
}
