import 'package:flutter/material.dart';
import '../models/booking.dart';

enum BookingStatus { current, past }

class BookingProvider with ChangeNotifier {
  List<Booking> _currentBookingList = [];
  List<Booking> _bookings = [];
  List<Booking> _pastBookingList = [];
  List<Booking> get currentBookings => _currentBookingList;
  List<Booking> get bookings => _bookings;
  List<Booking> get pastBookings => _pastBookingList;

  void filterBookings() {
    _currentBookingList = getCurrentBookings();
    _pastBookingList = getPastBookings();
  }

  List<Booking> getCurrentBookings() {
    DateTime currentDate = DateTime.now();
    return bookings.where((booking) {
      return booking.checkin!.isBefore(currentDate) &&
          booking.checkout!.isAfter(currentDate);
    }).toList();
  }

  List<Booking> getPastBookings() {
    DateTime currentDate = DateTime.now();
    return bookings.where((booking) {
      return booking.checkout!.isBefore(currentDate);
    }).toList();
  }

  // write function to saperate current bookings and past bookings list

  void bookhouse(Booking booking) async {
    // _currentBookingList.add(booking);
    _bookings.add(booking);
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
