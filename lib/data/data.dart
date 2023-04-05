// import 'package:houserental/models/property.dart';

void main() {
  double price = 100.0; // example price
  double taxRate = 0.18; // example tax rate

  double tax = price * taxRate;
  double finalPrice = price + tax;

  print('Price: ${price.toStringAsFixed(2)}');
  print('Tax: ${tax.toStringAsFixed(2)}');
  print('Final Price: ${finalPrice.toStringAsFixed(2)}');
}

// void main(){
// Address address = Address(
//   street: "123 Main Street",
//   // city: "Anytown",
//   state: "CA",
//   country: "USA",
//   zipcode: "12345",
// );

// List<String> photos = [
//   "https://example.com/photo1.jpg",
//   "https://example.com/photo2.jpg",
//   "https://example.com/photo3.jpg",
// ];

// List<String> category = [
//   "Entire House",
//   "Family Friendly",
//   "Pet Friendly",
// ];

// List<String> houserules = [
//   "No smoking",
//   "No parties",
//   "Quiet hours after 10pm",
// ];

// HouseProperty houseProperty = HouseProperty(
//   propertyid: "abc123",
//   housetitle: "Cozy Cottage",
//   photos: photos,
//   address: address,
//   checkintime: "3:00 PM",
//   checkouttime: "11:00 AM",
//   cleaningfee: 50,
//   bedcount: 2,
//   category: category,
//   houserules: houserules,
// );
  // print(houseProperty.toJson());
// }
