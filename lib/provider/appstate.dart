import 'package:flutter/material.dart';
import 'package:houserental/services/apiservice.dart';
import 'package:houserental/utils/snackbar.dart';
import '../models/property.dart';

class MyAppState with ChangeNotifier {
  List<HouseProperty> _favoriteslist = <HouseProperty>[];

  void toggleFavorite(HouseProperty homeitem) {
    if (_favoriteslist.contains(homeitem)) {
      _favoriteslist.remove(homeitem);
    } else {
      _favoriteslist.add(homeitem);
    }
    notifyListeners();
  }

  List<HouseProperty> get allhouseGetter {
    return [..._allhouses];
  }

  List<HouseProperty> get favouritelistGetter {
    return [..._favoriteslist];
  }

  bool isFavourite(String houseID) {
    return _favoriteslist.any((element) => element.propertyid == houseID);
  }

  void removeFavorite(HouseProperty houseTitle) {
    _favoriteslist.remove(houseTitle);
    notifyListeners();
  }

  void addHouse(
    int maxguests,
    String propertyid,
    String housetitle,
    List<dynamic> photos,
    double price,
    Address address,
    String checkintime,
    String checkouttime,
    double cleaningfee,
    int bedcount,
    List<dynamic> category,
    List<dynamic> housefeatures,
  ) {
    final newHouse = HouseProperty(
        maxguests: maxguests,
        owner: 'apiowner',
        propertyid: propertyid,
        housetitle: housetitle,
        photos: photos,
        price: price,
        address: address,
        checkintime: checkintime,
        checkouttime: checkouttime,
        cleaningfee: cleaningfee,
        bedcount: bedcount,
        category: category,
        features: housefeatures);
    // print(newHouse.toJson());
    print(_allhouses.length);
    _allhouses.add(newHouse);
    notifyListeners();
    ApiService.addHouse(newHouse);
    print('house added successfully');
    print(_allhouses.length);
  }

  List<HouseProperty> _allhouses = [
    HouseProperty(
        maxguests: 7,
        owner: 'uday',
        address: Address(
            country: 'country',
            state: 'state',
            zipcode: 'zipcode',
            street: 'street'),
        bedcount: 4,
        category: ['pool', 'beach'],
        checkintime: '11',
        checkouttime: '10',
        cleaningfee: 12000,
        features: ['rule1', 'rule2', 'rule3'],
        housetitle: 'houseTITLE',
        photos: [
          "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1598228723793-52759bba239c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
        ],
        price: 1033345,
        propertyid: 'qwertyui87654erty'),
    HouseProperty(
        maxguests: 7,
        owner: 'uday',
        address: Address(
            country: 'country',
            state: 'state',
            zipcode: 'zipcode',
            street: 'street'),
        bedcount: 4,
        category: ['pool', 'beach'],
        checkintime: '11',
        checkouttime: '10',
        cleaningfee: 12000,
        features: ['rule1', 'rule2'],
        housetitle: 'houseTITLE',
        photos: [
          "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
        ],
        price: 1033345,
        propertyid: 'qfgfd345egfsfs'),
    HouseProperty(
        maxguests: 2,
        owner: 'uday',
        address: Address(
            country: 'United States',
            state: 'California',
            zipcode: '90210',
            street: 'Beverly Hills Drive'),
        bedcount: 5,
        category: ['pool', 'spa', 'garden'],
        checkintime: '3pm',
        checkouttime: '11am',
        cleaningfee: 15000,
        features: ['No smoking', 'No parties'],
        housetitle: 'Luxury Beverly Hills Mansion',
        photos: [
          "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
        ],
        price: 1000000,
        propertyid: 'abcdefg12345hijkl'),
    HouseProperty(
        maxguests: 4,
        owner: 'uday',
        address: Address(
            country: 'Canada',
            state: 'Ontario',
            zipcode: 'M5V 1J2',
            street: 'King Street West'),
        bedcount: 2,
        category: ['downtown', 'city view'],
        checkintime: '4pm',
        checkouttime: '12pm',
        cleaningfee: 8000,
        features: ['No pets allowed', 'Quiet after 10pm'],
        housetitle: 'Stylish Downtown Toronto Condo',
        photos: [
          "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
        ],
        price: 500000,
        propertyid: 'poiuytrewq09876lkjh'),
    HouseProperty(
        maxguests: 5,
        owner: 'uday',
        address: Address(
            country: 'Spain',
            state: 'Andalusia',
            zipcode: '29650',
            street: 'Avenida Principe de Asturias'),
        bedcount: 3,
        category: ['pool', 'mountain view'],
        checkintime: '2pm',
        checkouttime: '10am',
        cleaningfee: 10000,
        features: ['No smoking', 'No loud music'],
        housetitle: 'Secluded Villa in the Mountains',
        photos: [
          "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
        ],
        price: 750000,
        propertyid: 'asdfghjkl12345qwerty'),
    HouseProperty(
        maxguests: 15,
        owner: 'uday',
        address: Address(
            country: 'Australia',
            state: 'New South Wales',
            zipcode: '2021',
            street: 'Oxford Street'),
        bedcount: 6,
        category: ['pool', 'beach', 'harbor view'],
        checkintime: '3pm',
        checkouttime: '11am',
        cleaningfee: 12000,
        features: ['No parties', 'No smoking'],
        housetitle: 'Luxury Sydney Harbor Mansion',
        photos: [
          "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
              "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
        ],
        price: 203400,
        propertyid: 'zxcvbnm09876poiuyt'),
  ];
}
