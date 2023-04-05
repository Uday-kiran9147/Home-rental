import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:provider/provider.dart';

import '../widgets/home_Item.dart';

class HouseDetailScreen extends StatelessWidget {
  static const routeName = 'house-detail';
  @override
  Widget build(BuildContext context) {
    final houseid = ModalRoute.of(context)!.settings.arguments;
    print(houseid);
    final appstate = Provider.of<MyAppState>(context);
    final selectedHouse = appstate.allhouseGetter.firstWhere(
      (element) => element.propertyid == houseid,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("At ${selectedHouse.address.country}"),
      ),
      body: appstate.allhouseGetter.isEmpty
          ? Center(
              child: Text('No images found.'),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      height: 370,
                      width: 600,
                      padding: EdgeInsets.all(10.0),
                      child: GridView.builder(
                        itemCount: selectedHouse.photos.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        selectedHouse.photos[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )),
                  Stack(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(top: 40, right: 14, left: 14),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectedHouse.address!.country.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      // decoration: TextDecoration.underline
                                    ),
                                  ),
                                  Text(
                                    "\$${selectedHouse.price}"
                                        .toString()
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (match) => '${match[1]},'),
                                    style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                selectedHouse.housetitle.toString(),
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                '${selectedHouse.address!.country}, ${selectedHouse.address!.state},${selectedHouse.address!.street} ${selectedHouse.address!.zipcode}',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Similar This',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                  height: 300,
                                  // width: 350,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: appstate.allhouseGetter.length,
                                      itemBuilder: (context, index) => HomeItem(
                                          propertyid: appstate
                                              .allhouseGetter[index].propertyid,
                                          owner: 'uday',
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
                                          houserules: appstate
                                              .allhouseGetter[index]
                                              .houserules))),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                      child: Text(
                    "House Rules",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).hintColor,
                    ),
                  )),
                  buildContainer(
                      ListView.builder(
                        // shrinkWrap: true,
                        itemCount: selectedHouse.houserules.length,
                        itemBuilder: (context, index) => ListTile(
                          // color: Theme.of(context).primaryColor,
                          title: Text(selectedHouse.houserules[index]),
                          leading: Text("${index + 1}"),
                        ),
                      ),
                      selectedHouse.houserules.length),
                ],
              ),
            ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                    onPressed: () {
                      // appState.toggleFavorite(selectedHouse);
                      appstate.toggleFavorite(selectedHouse);
                    },
                    icon: appstate
                            .isFavourite(selectedHouse.propertyid.toString())
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border))),
            SizedBox(width: 20),
            Expanded(
              child: InkWell(
                onTap: () {
                  // productController.addToCart();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Reserve',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(Widget child, int height) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   border: Border.all(color: Colors.grey),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      height: height * 70.toDouble(),
      width: 500,
      child: child,
    );
  }
}
