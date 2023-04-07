import 'dart:convert';

import 'package:houserental/models/booking.dart';
import 'package:houserental/models/property.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String _baseURL = 'http://localhost:5000';

  static Future<void> addHouse(HouseProperty property) async {
    print(property.toJson());
    Uri requestURI = Uri.parse(_baseURL + '/addhouse');
    var response = await http.post(requestURI, body: property.toJson());
    var decoded = jsonEncode(response.body);
    print(decoded);
  }

  static Future<void> bookhouse(Booking booking) async {
    Uri requestURI = Uri.parse(_baseURL + '/addbooking');
    // print(requestURI);
    // var firstjson=booking.toJson();
     var jsonBooking = jsonEncode(booking);
     print(jsonBooking);
    var response = await http.post(requestURI, body: jsonBooking);
    // var decode = jsonEncode(response);
    print(response.body);
  }
}



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