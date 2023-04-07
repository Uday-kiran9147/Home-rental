class Booking {
  DateTime? bookingdate;
  String? bookingid;
  DateTime? checkIn;
  DateTime? checkOut;
  double? bookingprice;
  int? guests;
  int? numberofdays;
  String? userid;
  String? houseid;

  Booking(
      {required this.bookingdate,
      required this.bookingid,
      required this.checkIn,
      required this.checkOut,
      required this.bookingprice,
      required this.guests,
      required this.numberofdays,
      required this.userid,
      required this.houseid});

  Booking.fromJson(Map<String, dynamic> json) {
    bookingdate = json['bookingdate'];
    bookingid = json['bookingid'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    bookingprice = json['bookingprice'];
    guests = json['guests'];
    numberofdays = json['numberofdays'];
    userid = json['userid'];
    houseid = json['houseid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingdate'] = this.bookingdate;
    data['bookingid'] = this.bookingid;
    data['check_in'] = this.checkIn;
    data['check_out'] = this.checkOut;
    data['bookingprice'] = this.bookingprice;
    data['guests'] = this.guests;
    data['numberofdays'] = this.numberofdays;
    data['userid'] = this.userid;
    data['houseid'] = this.houseid;
    return data;
  }
}
