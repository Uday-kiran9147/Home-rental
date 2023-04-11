// ignore_for_file: public_member_api_docs, sort_constructors_first

class HouseProperty {
  int maxguests;
  String propertyid;
  String owner;
  String housetitle;
  List<dynamic> photos;
  double price;
  Address address;
  String checkintime;
  String checkouttime;
  double cleaningfee;
  int bedcount;
  List<dynamic> category;
  List<dynamic> features;

  HouseProperty(
      {required this.maxguests,
      required this.propertyid,
      required this.owner,
      required this.housetitle,
      required this.photos,
      required this.price,
      required this.address,
      required this.checkintime,
      required this.checkouttime,
      required this.cleaningfee,
      required this.bedcount,
      required this.category,
      required this.features,});

//   HouseProperty.fromJson(Map<String, dynamic> json) {
//     propertyid = json['propertyid'];
//     housetitle = json['housetitle'];
//     photos = json['photos'].cast<String>();
//     address =
//         json['address'] = new Address.fromJson(json['address']);
//     checkintime = json['checkintime'];
//     checkouttime = json['checkouttime'];
//     cleaningfee = json['cleaningfee'];
//     bedcount = json['bedcount'];
//     category = json['category'].cast<String>();
//     houserules = json['houserules'].cast<String>();
//   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['propertyid'] = this.propertyid;
    data['housetitle'] = this.housetitle;
    data['photos'] = this.photos;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['checkintime'] = this.checkintime;
    data['checkouttime'] = this.checkouttime;
    data['cleaningfee'] = this.cleaningfee;
    data['bedcount'] = this.bedcount;
    data['category'] = this.category;
    data['houserules'] = this.features;
    return data;
  }
}

class Address {
  late String country;
  late String state;
  late String zipcode;
  late String street;

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
