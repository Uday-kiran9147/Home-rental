// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      bookingdate: json['bookingdate'] as String?,
      bookingid: json['bookingid'] as String?,
      checkin: json['checkin'] == null
          ? null
          : DateTime.parse(json['checkin'] as String),
      checkout: json['checkout'] == null
          ? null
          : DateTime.parse(json['checkout'] as String),
      bookingprice: (json['bookingprice'] as num?)?.toDouble(),
      guests: json['guests'] as int?,
      numberofdays: json['numberofdays'] as int?,
      userid: json['userid'] as String?,
      houseid: json['houseid'] as String?,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'bookingdate': instance.bookingdate,
      'bookingid': instance.bookingid,
      'checkin': instance.checkin?.toIso8601String(),
      'checkout': instance.checkout?.toIso8601String(),
      'bookingprice': instance.bookingprice,
      'guests': instance.guests,
      'numberofdays': instance.numberofdays,
      'userid': instance.userid,
      'houseid': instance.houseid,
    };
