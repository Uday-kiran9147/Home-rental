import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/screens/booking_detail_screen.dart';
import 'package:houserental/utils/snackbar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../utils/pricebeautify.dart';
import '../widgets/data_table.dart';
import '../widgets/suggession_builder.dart';

class HouseDetailScreen extends StatefulWidget {
  static const routeName = 'house-detail';

  @override
  State<HouseDetailScreen> createState() => _HouseDetailScreenState();
}

class _HouseDetailScreenState extends State<HouseDetailScreen> {
  final int initialQuantity = 1;
  // final int maxguests;
  DateTime? checkindate;
  DateTime? checkOutdate;
  int _guests = 1;

  @override
  void initState() {
    super.initState();
    _guests = initialQuantity;
  }

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
                        height: 250,
                        child: CarouselSlider(
                          options: CarouselOptions(),
                          items: selectedHouse.photos.map(
                            (index) {
                              return Builder(
                                builder: (BuildContext context) =>
                                    Image.network(
                                  index,
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              );
                            },
                          ).toList(),
                        )),
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 40, right: 14, left: 14),
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
                                    priceBeautify(
                                        selectedHouse.price.toString())
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
                                SingleChildScrollView(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('max Guest\'s'),
                                                Text(selectedHouse.maxguests
                                                    .toString())
                                              ],
                                            ),
                                          ),
                                          margin:
                                              const EdgeInsets.only(right: 6),
                                          width: 110,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            OutlinedButton(
                                                onPressed: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate: DateTime
                                                              .now(), //get today's date
                                                          firstDate: DateTime(
                                                              2000), //DateTime.now() - not to allow to choose before today.
                                                          lastDate:
                                                              DateTime(2101));
                                                  if (pickedDate != null) {
                                                    setState(() {
                                                      checkindate = pickedDate;
                                                    });
                                                  }
                                                },
                                                child: Text('check-in')),
                                            Text(checkindate == null
                                                ? 'no -date'
                                                : '${DateFormat.MMMd().format(checkindate as DateTime)}')
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            OutlinedButton(
                                                onPressed: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate: DateTime
                                                              .now(), //get today's date
                                                          firstDate: DateTime(
                                                              2000), //DateTime.now() - not to allow to choose before today.
                                                          lastDate:
                                                              DateTime(2101));
                                                  if (pickedDate != null) {
                                                    setState(() {
                                                      checkOutdate = pickedDate;
                                                    });
                                                  }
                                                },
                                                child: Text('check-out')),
                                            Text(checkOutdate == null
                                                ? 'no -date'
                                                : '${DateFormat.MMMd().format(checkOutdate as DateTime)}'),

                                            // overflow: TextOverflow.fade,
                                          ],
                                        ),
                                      ]),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      )),
                                  child:
                                      dataTable(selectedHouse: selectedHouse),
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
                                    child:
                                        sugessionBuilder(appstate: appstate)),
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
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(Icons.favorite_border, color: Colors.red))),
              SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (checkindate != null && checkOutdate != null) {
                      Duration duration = checkOutdate!.difference(
                          checkindate!); // difference between the dates
                      int noOfDays = duration.inDays;
                      print(noOfDays);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingDetailScreen(
                                checkIn: checkindate as DateTime,
                                checkOut: checkOutdate as DateTime,
                                bookingprice: selectedHouse.price,
                                guests: _guests,
                                numberofdays: noOfDays,
                                userid: 'temperoryuserID',
                                houseid: selectedHouse.propertyid),
                          ));
                    } else {
                      showSnackbarCustom(
                          context,
                          'please select check-in & check-out date',
                          Colors.indigo);
                    }
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
              Row(
                children: [
                  IconButton(
                    focusColor: Theme.of(context).primaryColor,
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (_guests > 0) {
                          _guests--;
                        }
                      });
                    },
                  ),
                  Text('$_guests'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        if (_guests < selectedHouse.maxguests) {
                          _guests++;
                        }
                      });
                      if (_guests == selectedHouse.maxguests) {
                        showSnackbarCustom(
                            context,
                            'maximun no.of guests Reached',
                            Colors.red.shade900);
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ));
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
