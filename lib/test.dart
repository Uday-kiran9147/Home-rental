import 'dart:convert';

void main() {
  var booking = {
    'bookingdate': '2023-04-08 00:37:01.471171',
    'bookingid': '1680894421471',
    'checkin': '2023-04-26 00:00:00.000',
    'checkout': '2023-04-29 00:00:00.000',
    'bookingprice': 3015000.0,
    'guests': 2,
    'numberofdays': 3,
    'userid': 'temperoryuserID',
    'houseid': 'abcdefg12345hijkl'
  };

  var jsonBooking = jsonEncode(booking);
  print(jsonBooking);
}
