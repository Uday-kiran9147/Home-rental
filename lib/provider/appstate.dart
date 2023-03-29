import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import '../models/dummy.dart';

class MyAppState with ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];

  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  var favoriteslist = <WordPair>[];

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favoriteslist.contains(pair)) {
      favoriteslist.remove(pair);
    } else {
      favoriteslist.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(WordPair pair) {
    favoriteslist.remove(pair);
    notifyListeners();
  }

  
   List<HomeProduct> homeList = [
    HomeProduct(
        state: "Hyderabad",
        country: "India",
        locality: "Mgbs",
        price: 22000,
        housename: "Villa with master Bedroom",
        category: 'Pool'),
    HomeProduct(
        state: "Maharashtra",
        country: "India",
        locality: "Pune",
        price: 15000,
        housename: "Apartment with Balcony",
        category: 'Garden'),
    HomeProduct(
        state: "Karnataka",
        country: "India",
        locality: "Bangalore",
        price: 24000,
        housename: "Villa with Private Pool",
        category: 'Balcony'),
    HomeProduct(
        state: "Goa",
        country: "India",
        locality: "Baga",
        price: 20000,
        housename: "Bungalow with Modern Interiors",
        category: 'Garden'),
    HomeProduct(
        state: "West Bengal",
        country: "India",
        locality: "Kolkata",
        price: 18000,
        housename: "Cottage with Private Garden",
        category: 'Terrace'),
    HomeProduct(
        state: "Uttar Pradesh",
        country: "India",
        locality: "Lucknow",
        price: 20000,
        housename: "Villa with Private Gym",
        category: 'Balcony'),
    HomeProduct(
        state: "Delhi",
        country: "India",
        locality: "Rohini",
        price: 21000,
        housename: "Apartment with Balcony",
        category: 'Terrace'),
    HomeProduct(
        state: "Haryana",
        country: "India",
        locality: "Gurgaon",
        price: 25000,
        housename: "Villa with Private Garden",
        category: 'Garden'),
    HomeProduct(
        state: "Rajasthan",
        country: "India",
        locality: "Jaipur",
        price: 22000,
        housename: "Bungalow with Modern Interiors",
        category: 'Pool'),
    HomeProduct(
        state: "Gujarat",
        country: "India",
        locality: "Ahmedabad",
        price: 19000,
        housename: "Cottage with Private Terrace",
        category: 'Balcony'),
    HomeProduct(
        state: "Tamil Nadu",
        country: "India",
        locality: "Chennai",
        price: 23000,
        housename: "Villa with Master Bedroom",
        category: 'Terrace')
  ];

}