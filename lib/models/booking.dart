class Booking {
  String? bookingdate;
  String? bookingid;
  String? checkin;
  String? checkout;
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

  Booking.fromJson(Map<String, dynamic> json) {
    bookingdate = json['bookingdate'];
    bookingid = json['bookingid'];
    checkin = json['checkin'];
    checkout = json['checkout'];
    bookingprice = json['bookingprice']as double;
    guests = json['guests'];
    numberofdays = json['numberofdays'];
    userid = json['userid'];
    houseid = json['houseid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingdate'] = this.bookingdate;
    data['bookingid'] = this.bookingid;
    data['checkin'] = this.checkin;
    data['checkout'] = this.checkout;
    data['bookingprice'] = this.bookingprice;
    data['guests'] = this.guests;
    data['numberofdays'] = this.numberofdays;
    data['userid'] = this.userid;
    data['houseid'] = this.houseid;
    return data;
  }
}
