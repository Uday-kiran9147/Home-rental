import 'package:flutter/material.dart';

import '../data/data.dart';
class MyAppState with ChangeNotifier {
  final List<HouseProperty> _wishlist = <HouseProperty>[];
  List<HouseProperty> _ownhouseList = <HouseProperty>[];
  List<HouseProperty> get ownHouseGetter => [..._ownhouseList];
  
  List<HouseProperty> get allhouseGetter {
    return [..._allhouses];
  }

  List<HouseProperty> get favouritelistGetter {
    return [..._wishlist];
  }

  void getownHouseList() {
    // await Future.delayed(Duration(seconds: 3));
    _ownhouseList =
        _allhouses.where((house) => house.ownerId.contains('kiran')).toList();
    // notifyListeners(); // commented due to rebuild issue.
  }

  void toggleFavorite(HouseProperty homeitem) {
    if (_wishlist.contains(homeitem)) {
      _wishlist.remove(homeitem);
    } else {
      _wishlist.add(homeitem);
    }
    notifyListeners();
  }

  List<HouseProperty> search_Houes(String searchQuery) {
    return _allhouses
        .where((element) =>
            element.housetitle
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            element.address.country
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
        .toList();
  }

  bool isFavourite(String houseID) {
    return _wishlist.any((element) => element.propertyid == houseID);
  }

  void removeFavorite(HouseProperty houseTitle) {
    _wishlist.remove(houseTitle);
    notifyListeners();
  }

  List<String> getCategories() {
    Set<String> categories = {};
    for (var house in _allhouses) {
      categories.addAll(house.category);
    }
    return categories.toList();
  }

  void addHouse(HouseProperty newHouse) async {
    _allhouses.add(newHouse);
    print(newHouse.toJson());
    notifyListeners();
  }

  Future<void> fetechHouses() async {
    // _allhouses.addAll(await ApiService.fetchhouse());
    // dynamic fetchedHouses = await ApiService.fetchHouses();
    // for (var house in fetchedHouses) {
    //   _allhouses.add(house);
    // }
    // notifyListeners();
  }

  final List<HouseProperty> _allhouses = [
    HouseProperty(
        maxguests: 7,
        ownerId: 'uday',
        address: Address(
            city: 'city',
            country: 'country',
            state: 'state',
            zipcode: 'zipcode',
            street: 'street'),
        bedcount: 4,
        category: [
          'Pool',
          'Historical_home',
          'Private_home',
          'National_Park',
          'Trending',
          'Island',
          'Camping',
          'Beach',
          'Lakefront',
          'Windmill'
        ],
        checkintime: '11 am',
        checkouttime: '10 am',
        cleaningfee: 12000,
        features: ['Tv', 'stadium near by', 'peaceful villa'],
        housetitle: 'Switzerland-kingdom',
        photos: [
          'https://images.unsplash.com/photo-1594568284297-7c64464062b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bm8lMjBjb3B5cmlnaHR8ZW58MHx8MHx8&w=1000&q=80'
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSFk3sf9c-vUGkQV9gTTwRYOkms-vAYntTNA&usqp=CAU',
        ],
        price: 1033345,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        propertyid: 'qwertyui87654erty'),
    HouseProperty(
        maxguests: 7,
        ownerId: 'uday',
        address: Address(
            city: 'Mexioni',
            country: 'Mexico',
            state: 'Manxi',
            zipcode: '220123',
            street: 'Streen 21, near KBC'),
        bedcount: 4,
        category: ['Pool', 'Beach'],
        checkintime: '11',
        checkouttime: '10',
        cleaningfee: 12000,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        features: ['rule1', 'rule2'],
        housetitle: 'Switzerland-kingdom',
        photos: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeAKcPNUDrsGj12N4UV2RsiXH9NatLyXfPvA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeAKcPNUDrsGj12N4UV2RsiXH9NatLyXfPvA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeAKcPNUDrsGj12N4UV2RsiXH9NatLyXfPvA&usqp=CAU',
        ],
        price: 1033345,
        propertyid: 'qfgfd345egfsfs'),
    HouseProperty(
        maxguests: 2,
        ownerId: 'kiran',
        address: Address(
            city: 'city',
            country: 'United States',
            state: 'California',
            zipcode: '90210',
            street: 'Beverly Hills Drive'),
        bedcount: 5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        category: ['Pool', 'Farm', 'Lakefront'],
        checkintime: '3pm',
        checkouttime: '11am',
        cleaningfee: 15000,
        features: ['No sAmoking', 'No parties'],
        housetitle: 'Luxury Beverly Hills Mansion',
        photos: [
          'https://www.nobroker.in/blog/wp-content/uploads/2022/07/Small-House-Designs.jpg',
          'https://assets-news.housing.com/news/wp-content/uploads/2022/04/07013406/ELEVATED-HOUSE-DESIGN-FEATURE-compressed.jpg'
        ],
        price: 1900000,
        propertyid: 'abcdefg12345hijkl'),
    HouseProperty(
        maxguests: 4,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        ownerId: 'uday',
        address: Address(
            city: 'city',
            country: 'Canada',
            state: 'Ontario',
            zipcode: 'M5V 1J2',
            street: 'King Street West'),
        bedcount: 2,
        category: ['Lakefront'],
        checkintime: '4pm',
        checkouttime: '12pm',
        cleaningfee: 8000,
        features: ['No pets allowed', 'Quiet after 10pm'],
        housetitle: 'Stylish Downtown Toronto Condo',
        photos: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJgKkiwYzoFNUOA3HUK-xHfoEnCcRd7emMZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJgKkiwYzoFNUOA3HUK-xHfoEnCcRd7emMZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJgKkiwYzoFNUOA3HUK-xHfoEnCcRd7emMZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJgKkiwYzoFNUOA3HUK-xHfoEnCcRd7emMZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJgKkiwYzoFNUOA3HUK-xHfoEnCcRd7emMZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJgKkiwYzoFNUOA3HUK-xHfoEnCcRd7emMZQ&usqp=CAU',
        ],
        price: 500000,
        propertyid: 'poiuytrewq09876lkjh'),
    HouseProperty(
        maxguests: 5,
        ownerId: 'kiran',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        address: Address(
            city: 'city',
            country: 'Spain',
            state: 'Andalusia',
            zipcode: '29650',
            street: 'Avenida Principe de Asturias'),
        bedcount: 3,
        category: ['Pool', 'Windmill'],
        checkintime: '2pm',
        checkouttime: '10am',
        cleaningfee: 10000,
        features: ['No smoking', 'No loud music'],
        housetitle: 'Secluded Villa in the Mountains',
        photos: [
          "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwaG91c2V8ZW58MHx8MHx8&w=1000&q=80"
        ],
        price: 750000,
        propertyid: 'asdfghjkl12345qwerty'),
    HouseProperty(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        maxguests: 15,
        ownerId: 'uday',
        address: Address(
            city: 'city',
            country: 'Australia',
            state: 'New South Wales',
            zipcode: '2021',
            street: 'Oxford Street'),
        bedcount: 6,
        category: ['Pool', 'Trending', 'Historical_home'],
        checkintime: '3pm',
        checkouttime: '11am',
        cleaningfee: 12000,
        features: ['No parties', 'No smoking'],
        housetitle: 'Luxury Sydney Harbor Mansion',
        photos: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg3WGYM7W4je7mKmpTIL2eNHxZw0885DjEwQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg3WGYM7W4je7mKmpTIL2eNHxZw0885DjEwQ&usqp=CAU',
        ],
        price: 203400,
        propertyid: 'zxcvbnm09876poiuyt'),
    HouseProperty(
        maxguests: 7,
        ownerId: 'uday',
        price: 139877,
        propertyid: '1681180640031',
        housetitle: 'Uday appartment',
        photos: [
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz9AeqRbMKScPQCLogjMQE4VhT1_54S1Lmvw&usqp=CAU",
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa4AzjjitSz9qV07LEAcey5JXGIWsRPfEwyyVaWjTwrTq2bTGWb9XX6NerA8BENtk3CpY&usqp=CAU',
          'https://www.buildofy.com/blog/content/images/2022/06/_DSC9610-Edited_-min.jpg',
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        address: Address(
            city: 'city',
            country: 'india',
            state: 'gujarat',
            zipcode: '382421',
            street: 'koba'),
        checkintime: '(22:25)',
        checkouttime: '(04:07)',
        cleaningfee: 1200.0,
        bedcount: 4,
        category: ['Island', 'Camping', 'Private_home', 'National_Park'],
        features: ['TV', 'Garden', 'Ocean fishes', 'Stadium nearby'])
  ];
}
