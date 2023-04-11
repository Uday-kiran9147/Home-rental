// import 'package:flutter/material.dart';

// import '../models/property.dart';

// class photoList extends StatelessWidget {
//   const photoList({
//     super.key,
//     required this.selectedHouse,
//   });

//   final HouseProperty selectedHouse;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: appstate.allhouseGetter.length,
//         itemBuilder: (context, index) => HomeItem(
//             propertyid: appstate
//                 .allhouseGetter[index].propertyid,
//             owner: 'uday',
//             housetitle: appstate
//                 .allhouseGetter[index].housetitle,
//             photos: appstate
//                 .allhouseGetter[index].photos,
//             price: appstate
//                 .allhouseGetter[index].price,
//             address: appstate
//                 .allhouseGetter[index].address,
//             checkintime: appstate
//                 .allhouseGetter[index]
//                 .checkintime,
//             checkouttime: appstate
//                 .allhouseGetter[index]
//                 .checkouttime,
//             cleaningfee: appstate
//                 .allhouseGetter[index]
//                 .cleaningfee,
//             bedcount: appstate
//                 .allhouseGetter[index].bedcount,
//             category: appstate
//                 .allhouseGetter[index].category,
//             features: appstate
//                 .allhouseGetter[index]
//                 .features));
//   }
// }
