import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/screens/booking_detail_screen.dart';
import 'package:houserental/utils/snackbar.dart';
import 'package:houserental/widgets/custom_image.dart';
import 'package:houserental/widgets/suggession_builder.dart';
import 'package:provider/provider.dart';
import '../utils/pricebeautify.dart';
import '../widgets/data_table.dart';
// import '../widgets/suggession_builder.dart';

class HouseDetailScreen extends StatefulWidget {
  static const routeName = 'house-detail';

  const HouseDetailScreen({super.key});

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
  Widget build(BuildContext context) {
    final houseid = ModalRoute.of(context)!.settings.arguments;
    // print(houseid);
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
            ? const Center(
                child: Text('No houses found!'),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: selectedHouse.photos.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CustomImageView(
                                  imagePath: "${selectedHouse.photos[index]}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )),
                    ),
                    Text(selectedHouse.photos.length.toString()),
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
                                SingleChildScrollView(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedHouse.address.country
                                            .toString(),
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
                                const Divider(),
                                Text(
                                  "What this place offer's",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                buildContainer(
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
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
                                Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 6),
                                          width: 110,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .highlightColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text('max Guest\'s'),
                                                Text(selectedHouse.maxguests
                                                    .toString())
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: ElevatedButton.icon(
                                              onPressed: () async {
                                                await _showDateRange(context)
                                                    .then((value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      checkindate = value.start;
                                                      checkOutdate = value.end;
                                                    });
                                                  }
                                                });
                                              },
                                              label:  Text('Date'),
                                              icon:Icon(Icons.date_range)))
                                    ]),
                                const SizedBox(height: 15),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      )),
                                  child:
                                      HouseDataTable(selectedHouse: selectedHouse),
                                ),
                                const SizedBox(height: 15),
                                // Text(
                                //   'Similar This',
                                //   style: GoogleFonts.poppins(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                                const SizedBox(height: 10),
                                // SizedBox(
                                //     height: 300,
                                //     width: 350,
                                //     child:
                                //         sugessionBuilder(appstate: appstate)
                                //     ),
                                // const SizedBox(height: 20),
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
          padding: const EdgeInsets.all(10),
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
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border,
                              color: Colors.red))),
              const SizedBox(width: 20),
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
                        border: Border.all(color: Colors.grey)),
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
                    icon: const Icon(Icons.remove),
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
                    icon: const Icon(Icons.add),
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

  Future<DateTimeRange?> _showDateRange(BuildContext context) {
    return showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 300)),
        initialDateRange: DateTimeRange(
            start: DateTime.now(),
            end: DateTime.now().add(const Duration(days: 3))));
  }

  Widget buildContainer(Widget child, int height) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      height: height * 70.toDouble(),
      width: 500,
      child: child,
    );
  }
}
