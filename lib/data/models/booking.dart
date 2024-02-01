import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';
@JsonSerializable(explicitToJson: true)
class Booking {
  String? bookingdate;
  String? bookingid;
  DateTime? checkin;
  DateTime? checkout;
  double? bookingprice;
  int? guests;
  int? numberofdays;
  String? userid;
  String? houseid;

  Booking({
    required this.bookingdate,
    required this.bookingid,
    required this.checkin,
    required this.checkout,
    required this.bookingprice,
    required this.guests,
    required this.numberofdays,
    required this.userid,
    required this.houseid,
  });

 factory Booking.fromJson(Map<String, dynamic> json) =>_$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
