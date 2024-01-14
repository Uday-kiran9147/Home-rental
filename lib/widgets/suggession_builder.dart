

import 'package:flutter/material.dart';
import 'package:houserental/models/property.dart';

import '../provider/appstate.dart';
import 'home_Item.dart';

class sugessionBuilder extends StatelessWidget {
  const sugessionBuilder({
    super.key,
    required this.appstate,
  });

  final MyAppState appstate;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: appstate.allhouseGetter.length,
        itemBuilder: (context, index) => HomeItem(property:  HouseProperty( maxguests: appstate.allhouseGetter[index].maxguests,
            propertyid: appstate
                .allhouseGetter[index].propertyid,
            ownerId: 'uday',
            housetitle: appstate
                .allhouseGetter[index].housetitle,
            photos: appstate
                .allhouseGetter[index].photos,
            price: appstate
                .allhouseGetter[index].price,
            address: appstate
                .allhouseGetter[index].address,
            checkintime: appstate
                .allhouseGetter[index]
                .checkintime,
            checkouttime: appstate
                .allhouseGetter[index]
                .checkouttime,
            cleaningfee: appstate
                .allhouseGetter[index]
                .cleaningfee,
            bedcount: appstate
                .allhouseGetter[index].bedcount,
            category: appstate
                .allhouseGetter[index].category,
                createdAt: appstate.allhouseGetter[index].createdAt,
                updatedAt: appstate.allhouseGetter[index].updatedAt,
            features: appstate
                .allhouseGetter[index]
                .features)));
  }
}
