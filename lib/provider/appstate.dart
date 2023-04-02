import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import '../models/dummy.dart';
import '../models/property.dart';
import '../widgets/home_Item.dart';

class MyAppState with ChangeNotifier {
  List<HomeProduct> favoriteslist = <HomeProduct>[];

  void toggleFavorite(HomeProduct homeitem) {
    if (favoriteslist.contains(homeitem)) {
      favoriteslist.remove(homeitem);
    } else {
      favoriteslist.add(homeitem);
    }
    notifyListeners();
  }

  bool isFavourite(String houseID) {
    return favoriteslist.any((element) => element.id == houseID);
  }

  void removeFavorite(HomeProduct houseTitle) {
    favoriteslist.remove(houseTitle);
    notifyListeners();
  }

  var data = [
    HouseProperty(
      propertyid: "abc123",
      housetitle: "Cozy Cottage",
      photos: [
        "https://example.com/photo1.jpg",
        "https://example.com/photo2.jpg",
        "https://example.com/photo3.jpg",
      ],
      address: Address(
        street: "123 Main Street",
        // city: "Anytown",
        state: "CA",
        country: "USA",
        zipcode: "12345",
      ),
      checkintime: "3:00 PM",
      checkouttime: "11:00 AM",
      cleaningfee: 50,
      bedcount: 2,
      category: [
        "Entire House",
        "Family Friendly",
        "Pet Friendly",
      ],
      houserules: [
        "No smoking",
        "No parties",
        "Quiet hours after 10pm",
      ],
    )
  ];

  List<HomeProduct> homeList = [
    HomeProduct(
        id: '01',
        state: "Hyderabad",
        country: "India",
        locality: "Mgbs",
        price: 22000,
        housename: "Villa with master Bus station",
        category: 'Pool'),
    HomeProduct(
        id: '02',
        state: "Maharashtra",
        country: "India",
        locality: "Pune",
        price: 15000,
        housename: "Apartment with Balcony",
        category: 'Garden'),
    HomeProduct(
        id: '03',
        state: "Karnataka",
        country: "India",
        locality: "Bangalore",
        price: 24000,
        housename: "Villa with Private Pool",
        category: 'Balcony'),
    HomeProduct(
        id: '04',
        state: "Goa",
        country: "India",
        locality: "Baga",
        price: 20000,
        housename: "Bungalow with Modern Interiors",
        category: 'Garden'),
    HomeProduct(
        id: '05',
        state: "West Bengal",
        country: "India",
        locality: "Kolkata",
        price: 18000,
        housename: "Cottage with Private Garden",
        category: 'Terrace'),
    HomeProduct(
        id: '06',
        state: "Uttar Pradesh",
        country: "India",
        locality: "Lucknow",
        price: 20000,
        housename: "Villa with Private Gym",
        category: 'Balcony'),
    HomeProduct(
        id: '07',
        state: "Delhi",
        country: "India",
        locality: "Rohini",
        price: 21000,
        housename: "Apartment with Balcony delhi",
        category: 'Terrace'),
    HomeProduct(
        id: '08',
        state: "Haryana",
        country: "India",
        locality: "Gurgaon",
        price: 25000,
        housename: "Gurgaon Villa with Private Garden",
        category: 'Garden'),
    HomeProduct(
        id: '09',
        state: "Rajasthan",
        country: "India",
        locality: "Jaipur",
        price: 22000,
        housename: "Bungalow with Modern Interiors",
        category: 'Pool'),
    HomeProduct(
        id: '10',
        state: "Gujarat",
        country: "India",
        locality: "Ahmedabad",
        price: 19000,
        housename: "Cottage with Private Terrace",
        category: 'Balcony'),
    HomeProduct(
        id: '11',
        state: "Tamil Nadu",
        country: "India",
        locality: "Chennai",
        price: 23000,
        housename: "Villa with Master Bedroom",
        category: 'Terrace')
  ];
}
