import 'package:flutter/material.dart';
import '../data/data.dart';

enum BookingStatus { current, past }

class BookingProvider with ChangeNotifier {
  List<Booking> _currentBookingList = [];
  List<Booking> _bookings = [];
  List<Booking> _pastBookingList = [];
  List<Booking> get currentBookings => _currentBookingList;
  List<Booking> get bookings => _bookings;
  List<Booking> get pastBookings => _pastBookingList;

  void filterBookings() {
    _currentBookingList.clear();
    _pastBookingList.clear();
    DateTime currentDate = DateTime.now();
    _bookings.forEach((element) {
      if (element.checkout!.isBefore(currentDate)) {
        _pastBookingList.add(element);
      } else {
        _currentBookingList.add(element);
      }
    });
  }

  // List<Booking> getCurrentBookings() {
  //   DateTime currentDate = DateTime.now();
  //   return _bookings.where((booking) {
  //     return booking.checkin!.isAfter(currentDate) &&
  //         booking.checkout!.isAfter(currentDate);
  //   }).toList();
  // }

  // List<Booking> getPastBookings() {
  //   DateTime currentDate = DateTime.now();
  //   return _bookings.where((booking) {
  //     return booking.checkout!.isBefore(currentDate);
  //   }).toList();
  // }

  // write function to saperate current bookings and past bookings list

  void bookhouse(Booking booking) async {
    // _currentBookingList.add(booking);
    _bookings.add(booking);
    filterBookings();
    //  await ApiService.bookhouse(booking);
    notifyListeners();
  }

  Future<void> fetchbookings() async {
    // ApiService.fetchbookings();
    notifyListeners();
  }
}
