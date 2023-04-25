import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:houserental/models/booking.dart';
import 'package:houserental/models/property.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String _baseURL = 'https://houserental.onrender.com';
  // static String _baseURLandroid = 'http://10.0.2.2:5000';
  static String firebaseURL =
      "https://flutternotes-97058-default-rtdb.firebaseio.com/housrproperty.json";
  static var data = [];

  // static Future<void> androidfetchbookings() async {
  //   final url = _baseURLandroid + "/allbookings";
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     data = jsonDecode(response.body.toString());
  //   } else {
  //     print('error: ' + response.statusCode.toString());
  //   }
  // }

  static Future<void> fetchbookings() async {
    final url = _baseURL + "/allbookings";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      print('error: ' + response.statusCode.toString());
    }
  }

  static Future<List<HouseProperty>> fetchhouse() async {
    final url = firebaseURL;
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<HouseProperty> loadedHouses = [];
    extractedData.forEach((key, value) {
      loadedHouses.add(HouseProperty(
          maxguests: value['maxguests'],
          propertyid: value['propertyid'],
          owner: value['owner'],
          housetitle: value['housetitle'],
          photos: value['photos'],
          price: value['price'],
          address: Address.fromJson(value['address']),
          checkintime: value['checkintime'],
          checkouttime: value['checkouttime'],
          cleaningfee: value['cleaningfee'],
          bedcount: value['bedcount'],
          category: ['category'],
          features: ['features']));
    });
    return loadedHouses;
  }

  static Future<void> addHouse(HouseProperty property) async {
    Uri requestURI = Uri.parse(firebaseURL);
    // var jsonHouseProperty = jsonEncode(property);
    // print(jsonHouseProperty);
    var response = await http.post(requestURI,
        body: json.encode({
          'maxguests': property.maxguests,
          'propertyid': property.propertyid,
          'owner': property.owner,
          'housetitle': property.housetitle,
          'photos': property.photos,
          'price': property.price,
          'address': property.address.toJson(),
          'checkintime': property.checkintime,
          'checkouttime': property.checkouttime,
          'cleaningfee': property.cleaningfee,
          'bedcount': property.bedcount,
          'category': property.category,
          'features': property.features,
        }),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'});
    print(response.body);
  }

  static Future<void> bookhouse(Booking booking) async {
    Uri requestURI = Uri.parse(_baseURL + '/addbooking');
    var jsonBooking = jsonEncode(booking);
    print(jsonBooking);
    var response = await http.post(requestURI,
        body: jsonBooking, headers: {'Content-Type': 'application/json'});
    print(response.body);
  }
}
// static Future<List<Note>> fetchNote(String userid) async {
//     Uri requestURI = Uri.parse(_baseURL + '/list');
//     var response = await http.post(requestURI, body: {'userid': userid});
//     var decoded = jsonDecode(response.body);
//     print(decoded);
//     List<Note> noteList = [];
//     for (var notemap in decoded) {
//       Note newnote = Note.fromMap(notemap);
//       noteList.add(newnote);
//     }
//     return noteList;
//   }
  // static Future<List<Booking>> fetchbookings() async {
  //   List<Booking> bookings = [];
  //   Uri requestURI = Uri.parse(_baseURL + '/allbookings');
  //   var response = await http.get(requestURI);
  //   var data = jsonDecode(response.body);
  //   print(jsonEncode(data));
  //   if (response.statusCode == 200) {
  //     for (var i in data) {
        // bookings.add(Booking.fromJson(i));
        // print(i);
//       }
//       return bookings;
//     }
//     return bookings;
//   }
// }



  // var data;
  // Future<void> getdatawithoutmodel() async {
  //   final response =
  //       await http.get(Uri.parse("http://localhost:5000/allhouse"));
  //   if (response.statusCode == 200) {
  //     data = jsonDecode(response.body.toString());
  //     print(data[3]['housetitle']);
  //   } else {
  //     print('error: ' + response.statusCode.toString());
  //   }
  // }

  // void main(){
  //   getdatawithoutmodel();
  // }