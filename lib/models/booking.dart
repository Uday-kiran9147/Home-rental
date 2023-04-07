class Booking {
  String bookingdate;
  String bookingid;
  String checkin;
  String checkout;
  String bookingprice;
  String guests;
  String numberofdays;
  String userid;
  String houseid;

  Booking(
      {required this.bookingdate,
      required this.bookingid,
      required this.checkin,
      required this.checkout,
      required this.bookingprice,
      required this.guests,
      required this.numberofdays,
      required this.userid,
      required this.houseid});

  // Booking.fromJson(Map<String, dynamic> json) {
  //   bookingdate = json['bookingdate'];
  //   bookingid = json['bookingid'];
  //   checkIn = json['checkin'];
  //   checkOut = json['checkout'];
  //   bookingprice = json['bookingprice'];
  //   guests = json['guests'];
  //   numberofdays = json['numberofdays'];
  //   userid = json['userid'];
  //   houseid = json['houseid'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingdate'] = bookingdate;
    data['bookingid'] = bookingid;
    data['checkin'] = checkin;
    data['checkout'] = checkout;
    data['bookingprice'] = bookingprice;
    data['guests'] = guests;
    data['numberofdays'] = numberofdays;
    data['userid'] = userid;
    data['houseid'] = houseid;
    return data;
  }
}
