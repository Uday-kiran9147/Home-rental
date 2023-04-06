import 'package:flutter/material.dart';
import '../models/booking.dart';

class BookingProvider with ChangeNotifier {
  List<Booking> _bookingslist = [];

  List<Booking> get bookinglistgetter {
    return [..._bookingslist];
  }
}
