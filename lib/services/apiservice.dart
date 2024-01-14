// import 'dart:convert';
// import 'dart:io';

// // import 'package:firebase_storage/firebase_storage.dart';
// import 'package:houserental/models/booking.dart';
// import 'package:houserental/models/property.dart';
// import 'package:http/http.dart' as http;

// import '../models/user.dart';

// class ApiService {
//   static const String _baseURL = 'https://houserental.onrender.com';
//   // static String _baseURLandroid = 'http://10.0.2.2:5000';
//   static String firebaseURL =
//       "https://flutternotes-97058-default-rtdb.firebaseio.com";
//   static var data = [];

//   // static Future<void> androidfetchbookings() async {
//   //   final url = _baseURLandroid + "/allbookings";
//   //   final response = await http.get(Uri.parse(url));
//   //   if (response.statusCode == 200) {
//   //     data = jsonDecode(response.body.toString());
//   //   } else {
//   //     print('error: ' + response.statusCode.toString());
//   //   }
//   // }

//   static Future<void> fetchbookings() async {
//     const url = "$_baseURL/allbookings";
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       data = jsonDecode(response.body.toString());
//     } else {
//       print('error: ${response.statusCode}');
//     }
//   }

// static Future<List<HouseProperty>> fetchHouses() async {

//   try {
//     final url = Uri.parse("https://flutternotes-97058-default-rtdb.firebaseio.com/housrproperty.json");
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final extractedData = json.decode(response.body);
//       final List<HouseProperty> loadedHouses = [];
//         // print(extractedData);
//       if (extractedData != null && extractedData is Map) {
//         extractedData.forEach((key, value) {
//           loadedHouses.add(HouseProperty(
//             maxguests: value['maxguests'],
//             propertyid: value['propertyid'],
//             owner: value['owner'],
//             housetitle: value['housetitle'],
//             photos: value['photos'],
//             price: (value['price'] as num).toDouble(),
//             address: Address.fromJson(value['address']),
//             checkintime: value['checkintime'],
//             checkouttime: value['checkouttime'],
//             cleaningfee: (value['cleaningfee'] as num).toDouble(),
//             bedcount: value['bedcount'],
//             category: value['category'] != null ? List<String>.from(value['category']) : [],
//             features: value['features'] != null ? List<String>.from(value['features']) : [],
//           ));
//         });
//       }

//       return loadedHouses;
//     } else {
//       throw Exception('Failed to load data from the server');
//     }
//   } catch (error) {
//     rethrow; // Handle the error as needed in the calling code
//   }
// }


//   static Future<void> adduser(User user) async {
//     Uri requestURI = Uri.parse("$firebaseURL/User.json");
//     var response = await http.post(requestURI,
//         body: json.encode({
//           'name': user.name,
//           'profile': user.profile,
//           'phonenumber': user.phonenumber,
//           'email': user.email,
//         }),
//         headers: {'Content-Type': 'application/x-www-form-urlencoded'});
//     print(response.body);
//   }

 

// static Future<void> addHouseWithImages(HouseProperty property) async {
//   // Step 1: Post JSON data to the database without image URLs
//   Uri requestURI = Uri.parse("$firebaseURL/housrproperty.json");
//   var response = await http.post(requestURI,
//       body: json.encode({
//         'propertyid':property.propertyid,
//         'maxguests': property.maxguests,
//         'owner': property.owner,
//         'housetitle': property.housetitle,
//         'price': property.price,
//         'address': property.address.toJson(),
//         'checkintime': property.checkintime,
//         'checkouttime': property.checkouttime,
//         'cleaningfee': property.cleaningfee,
//         'bedcount': property.bedcount,
//         'category': property.category,
//         'features': property.features,
//       }),
//       headers: {'Content-Type': 'application/json'});

//   if (response.statusCode == 200) {
//     final responseData = json.decode(response.body);
    
//     // Step 2: Retrieve the unique identifier (e.g., Firebase's auto-generated key)
//     final String propertyId = responseData['name'];
//     print(propertyId);
//     // Step 3: Upload images and obtain their URLs
//     List<String> imageUrls = [];
//     if (property.photos.isNotEmpty) {
//       for (int i = 0; i < property.photos.length; i++) {
//         var ref = FirebaseStorage.instance.ref().child('Houses').child(
//             "House-Rental-${property.photos[i].hashCode}-$propertyId-${i + 1}");
//         await ref.putFile(File(property.photos[i]));
//         var currentImage = await ref.getDownloadURL();
//         imageUrls.add(currentImage);
//       }
//     }

//     // Step 4: Update the JSON data with image URLs
//     Uri updateURI = Uri.parse("$firebaseURL/housrproperty/$propertyId.json");
//     var updateResponse = await http.patch(updateURI,
//         body: json.encode({
//           'photos': imageUrls,
//         }),
//         headers: {'Content-Type': 'application/json'});

//     print(updateResponse.body);
//   } else {
//     print('Error posting JSON data: ${response.statusCode}');
//   }
// }


//   static Future<void> bookhouse(Booking booking) async {
//     Uri requestURI = Uri.parse('$_baseURL/addbooking');
//     var jsonBooking = jsonEncode(booking);
//     print(jsonBooking);
//     var response = await http.post(requestURI,
//         body: jsonBooking, headers: {'Content-Type': 'application/json'});
//     print(response.body);
//   }
// }
// // static Future<List<Note>> fetchNote(String userid) async {
// //     Uri requestURI = Uri.parse(_baseURL + '/list');
// //     var response = await http.post(requestURI, body: {'userid': userid});
// //     var decoded = jsonDecode(response.body);
// //     print(decoded);
// //     List<Note> noteList = [];
// //     for (var notemap in decoded) {
// //       Note newnote = Note.fromMap(notemap);
// //       noteList.add(newnote);
// //     }
// //     return noteList;
// //   }
//   // static Future<List<Booking>> fetchbookings() async {
//   //   List<Booking> bookings = [];
//   //   Uri requestURI = Uri.parse(_baseURL + '/allbookings');
//   //   var response = await http.get(requestURI);
//   //   var data = jsonDecode(response.body);
//   //   print(jsonEncode(data));
//   //   if (response.statusCode == 200) {
//   //     for (var i in data) {
//         // bookings.add(Booking.fromJson(i));
//         // print(i);
// //       }
// //       return bookings;
// //     }
// //     return bookings;
// //   }
// // }



//   // var data;
//   // Future<void> getdatawithoutmodel() async {
//   //   final response =
//   //       await http.get(Uri.parse("http://localhost:5000/allhouse"));
//   //   if (response.statusCode == 200) {
//   //     data = jsonDecode(response.body.toString());
//   //     print(data[3]['housetitle']);
//   //   } else {
//   //     print('error: ' + response.statusCode.toString());
//   //   }
//   // }

//   // void main(){
//   //   getdatawithoutmodel();
//   // }