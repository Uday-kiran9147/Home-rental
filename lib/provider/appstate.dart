import 'package:flutter/material.dart';
import 'package:houserental/services/apiservice.dart';
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
    // print(_allhouses.length);
    _allhouses.add(newHouse);
    notifyListeners();
    ApiService.addHouse(newHouse);
    print('house added successfully');
    // print(_allhouses.length);
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
        checkintime: '11 am',
        checkouttime: '10 am',
        cleaningfee: 12000,
        features: ['Tv', 'stadium near by', 'peaceful villa'],
        housetitle: 'Pool-House',
        photos: [
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSFk3sf9c-vUGkQV9gTTwRYOkms-vAYntTNA&usqp=CAU',
              'https://images.unsplash.com/photo-1594568284297-7c64464062b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bm8lMjBjb3B5cmlnaHR8ZW58MHx8MHx8&w=1000&q=80'
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
        housetitle: 'Switzerland-kingdom',
        photos: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeAKcPNUDrsGj12N4UV2RsiXH9NatLyXfPvA&usqp=CAU',
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
        features: ['No sAmoking', 'No parties'],
        housetitle: 'Luxury Beverly Hills Mansion',
        photos: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeAKcPNUDrsGj12N4UV2RsiXH9NatLyXfPvA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeAKcPNUDrsGj12N4UV2RsiXH9NatLyXfPvA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeAKcPNUDrsGj12N4UV2RsiXH9NatLyXfPvA&usqp=CAU',
        ],
        price: 1900000,
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
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJgKkiwYzoFNUOA3HUK-xHfoEnCcRd7emMZQ&usqp=CAU',
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
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYvoUIq0tkDI8IKS4bRowhty6qs0CYUlde-Q&usqp=CAU',
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
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg3WGYM7W4je7mKmpTIL2eNHxZw0885DjEwQ&usqp=CAU',
        ],
        price: 203400,
        propertyid: 'zxcvbnm09876poiuyt'),
    HouseProperty(
        maxguests: 7,
        owner: 'uday',
        price: 139877,
        propertyid: '1681180640031',
        housetitle: 'Uday appartment',
        photos: [
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz9AeqRbMKScPQCLogjMQE4VhT1_54S1Lmvw&usqp=CAU",
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa4AzjjitSz9qV07LEAcey5JXGIWsRPfEwyyVaWjTwrTq2bTGWb9XX6NerA8BENtk3CpY&usqp=CAU',
              'https://www.buildofy.com/blog/content/images/2022/06/_DSC9610-Edited_-min.jpg',
        ],
        address: Address(
            country: 'india',
            state: 'gujarat',
            zipcode: '382421',
            street: 'koba'),
        checkintime: '(22:25)',
        checkouttime: '(04:07)',
        cleaningfee: 1200.0,
        bedcount: 4,
        category: [],
        features: ['TV', 'Garden', 'Ocean fishes', 'Stadium nearby'])
  ];
}
