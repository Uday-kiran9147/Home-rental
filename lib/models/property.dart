// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HouseProperty {
  String? propertyid;
  String? housetitle;
  List<String>? photos;
  double? price;
  Address? address;
  String? checkintime;
  String? checkouttime;
  int? cleaningfee;
  int? bedcount;
  List<String>? category;
  List<String>? houserules;

  HouseProperty(
      {this.propertyid,
      this.housetitle,
      this.photos,
      this.price,
      this.address,
      this.checkintime,
      this.checkouttime,
      this.cleaningfee,
      this.bedcount,
      this.category,
      this.houserules});

  HouseProperty.fromJson(Map<String, dynamic> json) {
    propertyid = json['propertyid'];
    housetitle = json['housetitle'];
    photos = json['photos'].cast<String>();
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    checkintime = json['checkintime'];
    checkouttime = json['checkouttime'];
    cleaningfee = json['cleaningfee'];
    bedcount = json['bedcount'];
    category = json['category'].cast<String>();
    houserules = json['houserules'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['propertyid'] = this.propertyid;
    data['housetitle'] = this.housetitle;
    data['photos'] = this.photos;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['checkintime'] = this.checkintime;
    data['checkouttime'] = this.checkouttime;
    data['cleaningfee'] = this.cleaningfee;
    data['bedcount'] = this.bedcount;
    data['category'] = this.category;
    data['houserules'] = this.houserules;
    return data;
  }
}

class Address {
   String? country;
   String? state;
   String? zipcode;
   String? street;

  Address(
      {required this.country,
      required this.state,
      required this.zipcode,
      required this.street});

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    state = json['state'];
    zipcode = json['zipcode'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['street'] = this.street;
    return data;
  }
}
