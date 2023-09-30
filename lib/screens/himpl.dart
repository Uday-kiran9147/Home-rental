import 'package:flutter/material.dart';
import 'package:houserental/models/property.dart';
import 'package:houserental/widgets/home_Item.dart';
import 'package:firebase_database/firebase_database.dart';
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
  Query dbRef = FirebaseDatabase.instance.ref().child('housrproperty');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('housrproperty');

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<MyAppState>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.shade300, // Background color
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            search = value;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black, // Text color
                        ),
                        cursorColor: Colors.blue,
                        decoration: const InputDecoration(
                          border: InputBorder.none, // No border
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              maxCrossAxisExtent: 400,
            ),
            children: appState.search_Houes(search).map((val) {
              return HomeItem(
                property: HouseProperty(
                  maxguests: val.maxguests,
                  propertyid: val.propertyid,
                  owner: 'uday',
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
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

/*         //     child: FirebaseAnimatedList(
        //   query: dbRef, // Replace with your database reference
        //   itemBuilder: (context, DataSnapshot snapshot,
        //       Animation<double> animation, index) {
        //     // Access data directly from snapshot.value
        //     Map houseProperty = snapshot.value as Map;
        //     print(snapshot.value);
        //     print(houseProperty['address']['city']);

        //     var homeItem = HouseProperty(
        //       maxguests: houseProperty['maxguests'],
        //       propertyid: houseProperty['propertyid'],
        //       owner: houseProperty['owner'],
        //       housetitle: houseProperty['housetitle'],
        //       photos: houseProperty['photos'],
        //       price: houseProperty['price'],
        //       address: Address(
        //           city: houseProperty['address']['city'],
        //           country: houseProperty['address']['country'],
        //           state: houseProperty['address']['state'],
        //           street: houseProperty['address']['street'],
        //           zipcode: houseProperty['address']['zipcode']),
        //       checkintime: houseProperty['checkintime'],
        //       checkouttime: houseProperty['checkouttime'],
        //       cleaningfee: houseProperty['cleaningfee'],
        //       bedcount: houseProperty['bedcount'],
        //       category: houseProperty['category'] ?? [],
        //       features: houseProperty['features'],
        //     );
        //     appState.addHouse(homeItem);
        //     return HomeItem(property: homeItem);
        //   },
        // ) */