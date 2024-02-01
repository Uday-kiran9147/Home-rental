import 'package:flutter/material.dart';
import 'package:houserental/data/data.dart';
import 'package:houserental/widgets/home_Item.dart';
import 'package:provider/provider.dart';
import '../provider/appstate.dart';

class HomeImplement extends StatefulWidget {
  const HomeImplement({
    super.key,
  });

  @override
  State<HomeImplement> createState() => _HomeImplementState();
}

class _HomeImplementState extends State<HomeImplement> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<MyAppState>(context);
    return GridView(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        maxCrossAxisExtent: 400,
      ),
      children: appState.search_Houes(search).map((val) {
        return HomeItem(
          property: HouseProperty(
            maxguests: val.maxguests,
            propertyid: val.propertyid,
            ownerId: 'uday',
            housetitle: val.housetitle,
            photos: val.photos,
            price: val.price,
            address: val.address,
            checkintime: val.checkintime,
            checkouttime: val.checkouttime,
            cleaningfee: val.cleaningfee,
            bedcount: val.bedcount,
            category: val.category,
            features: val.features,
            createdAt: val.createdAt,
            updatedAt: val.updatedAt,
          ),
        );
      }).toList(),
    );
  }
}
