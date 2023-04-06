import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houserental/models/property.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/screens/paymentScreen.dart';
import 'package:houserental/screens/payment_detail_screen.dart';
import 'package:provider/provider.dart';

import '../utils/pricebeautify.dart';
import '../widgets/data_table.dart';
import '../widgets/home_Item.dart';
import '../widgets/photo_list.dart';
import '../widgets/reserve_button.dart';
import '../widgets/suggession_builder.dart';

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
                      child: photoList(selectedHouse: selectedHouse)),
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
                                    selectedHouse.address.country.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      // decoration: TextDecoration.underline
                                    ),
                                  ),
                                  priceBeautify(selectedHouse.price.toString())
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
                                '${selectedHouse.address.country}, ${selectedHouse.address.state},${selectedHouse.address.street} ${selectedHouse.address.zipcode}',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Divider(),

                              Text(
                                "What this place offer\'s",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              buildContainer(
                                  ListView.builder(
                                    // shrinkWrap: true,
                                    itemCount: selectedHouse.features.length,
                                    itemBuilder: (context, index) => ListTile(
                                      // color: Theme.of(context).primaryColor,
                                      title:
                                          Text(selectedHouse.features[index]),
                                      leading: Text("${index + 1}"),
                                    ),
                                  ),
                                  selectedHouse.features.length),

                              Text(
                                'Things to know',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    // color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                      15,
                                    )),
                                child: dataTable(selectedHouse: selectedHouse),
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
                                  child: sugessionBuilder(appstate: appstate)),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      bottomNavigationBar: bottomNavigation(appstate, selectedHouse, context),
    );
  }


  Widget buildContainer(Widget child, int height) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      height: height * 70.toDouble(),
      width: 500,
      child: child,
    );
  }
}
