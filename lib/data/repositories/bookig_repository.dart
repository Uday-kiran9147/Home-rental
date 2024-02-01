import '../data.dart';

abstract class BookingRepository {
  Future<List<Booking>> getAllBookings();
  Future<Booking> getBooking(int id);
  Future<Booking> createBooking(Booking newBooking);
  Future<Booking> updateBooking(Booking booking);
  Future<void> deleteBooking(int id);
}
