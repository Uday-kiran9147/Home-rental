import 'package:flutter/material.dart';
import 'package:houserental/services/apiservice.dart';
import '../models/booking.dart';

class BookingProvider with ChangeNotifier {
  final List<Booking> _bookingslist = [];

  void bookhouse(Booking booking) async{
    _bookingslist.add(booking);
   await ApiService.bookhouse(booking);
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
