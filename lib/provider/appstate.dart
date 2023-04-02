import 'package:flutter/material.dart';

import '../models/dummy.dart';
import '../models/property.dart';

class MyAppState with ChangeNotifier {
  List<HouseProperty> _favoriteslist = <HouseProperty>[];
  List<HouseProperty> _allhouses = [
    HouseProperty(
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
        houserules: ['rule1', 'rule2'],
        housetitle: 'houseTITLE',
        photos: [
          'https://img.staticmb.com/mbcontent//images/uploads/2022/12/Most-Beautiful-House-in-the-World.jpg'
        ],
        price: 1033345,
        propertyid: 'qwertyui87654erty'),
    HouseProperty(
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
        houserules: ['rule1', 'rule2'],
        housetitle: 'houseTITLE',
        photos: [
          'data:image/jpeg;base64,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'
        ],
        price: 1033345,
        propertyid: 'qfgfd345egfsfs'),
    HouseProperty(
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
        houserules: ['No smoking', 'No parties'],
        housetitle: 'Luxury Beverly Hills Mansion',
        photos: [
          'https://i.pinimg.com/originals/9a/fd/df/9afddfb327522a2f10784efeeb417bec.jpg'
        ],
        price: 1000000,
        propertyid: 'abcdefg12345hijkl'),
    HouseProperty(
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
        houserules: ['No pets allowed', 'Quiet after 10pm'],
        housetitle: 'Stylish Downtown Toronto Condo',
        photos: [
          'https://www.blogto.com/listings/real-estate-condos-apartments-for-sale-toronto/uploads/2020/06/20200626-1508-1030x686.jpg'
        ],
        price: 500000,
        propertyid: 'poiuytrewq09876lkjh'),
    HouseProperty(
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
        houserules: ['No smoking', 'No loud music'],
        housetitle: 'Secluded Villa in the Mountains',
        photos: [
          'https://www.spain-holiday.com/PHOTO_UPLOAD/casa-carina--30150_1.jpg'
        ],
        price: 750000,
        propertyid: 'asdfghjkl12345qwerty'),
    HouseProperty(
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
        houserules: ['No parties', 'No smoking'],
        housetitle: 'Luxury Sydney Harbor Mansion',
        photos: [
          'https://i.pinimg.com/originals/89/57/b8/8957b878e32ec03297a365f7b9d14e34.jpg'
        ],
        price: 2000000,
        propertyid: 'zxcvbnm09876poiuyt'),
  ];

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

}
