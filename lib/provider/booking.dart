import 'package:flutter/material.dart';
import 'package:houserental/services/apiservice.dart';
import '../models/booking.dart';

class BookingProvider with ChangeNotifier {
  List<Booking> _bookingslist = [];

  void bookhouse(Booking booking) {
    _bookingslist.add(booking);
    ApiService.bookhouse(booking);
    notifyListeners();
  }

  Future<void> fetchbookings() async {
    ApiService.fetchbookings();
    notifyListeners();
  }

  List<Booking> get bookinglistgetter {
    return [..._bookingslist];
  }
}
