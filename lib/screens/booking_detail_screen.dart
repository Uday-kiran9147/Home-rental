import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houserental/data/data.dart';
import 'package:houserental/provider/booking.dart';
import 'package:houserental/utils/notifications.dart';
import 'package:houserental/utils/snackbar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:houserental/provider/appstate.dart';
import 'package:houserental/screens/payments/paymentScreen.dart';
import 'package:houserental/utils/pricebeautify.dart';

import '../main.dart';

// ignore: must_be_immutable
class BookingDetailScreen extends StatefulWidget {
  // DateTime bookingdate;
  // String bookingid;
  DateTime? checkIn;
  DateTime? checkOut;
  double bookingprice;
  int guests;
  int numberofdays;
  String userid;
  String houseid;
  BookingDetailScreen({
    Key? key,
    //  required this.bookingdate,
    //  required this.bookingid,
    required this.checkIn,
    required this.checkOut,
    required this.bookingprice,
    required this.guests,
    required this.numberofdays,
    required this.userid,
    required this.houseid,
  }) : super(key: key);

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  // static const routeName = 'house-payment-details';
  @override
  Widget build(BuildContext context) {
    // final houseid = ModalRoute.of(context)!.settings.arguments;

    final appstate = Provider.of<MyAppState>(context);
    final selectedHouse = appstate.allhouseGetter.firstWhere(
      (element) => element.propertyid == widget.houseid,
    );
    double? localprice = widget.bookingprice;
    double? pricewithdays = localprice * 3;
    double? cleaning = selectedHouse.cleaningfee;

    double finalPrice = pricewithdays + cleaning;

    // print('Price: ${localprice.toStringAsFixed(2)}');
    // print('price with days: ${pricewithdays.toStringAsFixed(2)}');
    // print('Final Price: ${finalPrice.toStringAsFixed(2)}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('House Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Property Address",
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                '${selectedHouse.address.country}-  ${selectedHouse.address.state}- ${selectedHouse.address.street}- ${selectedHouse.address.zipcode}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                '1-day price',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              priceBeautify(selectedHouse.price.toString()),
              const SizedBox(width: 10.0),
              const SizedBox(height: 20.0),
              Text(
                'No.of.guests ${widget.guests}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.green),
              ),
              Text(
                '${widget.numberofdays} day\'s of vacation.......',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.green),
              ),
              const SizedBox(height: 10.0),
              DataTable(
                columns: const [
                  DataColumn(label: Text('Source')),
                  DataColumn(label: Text('Price')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text(
                      "\$$localprice x${widget.numberofdays}"
                          .toString()
                          .replaceAllMapped(
                              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (match) => '${match[1]},'),
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                    DataCell(
                        dataTablepriceBeautify((pricewithdays).toString())),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text(
                      'cleaning fee',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )),
                    DataCell(dataTablepriceBeautify(cleaning.toString())),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      "Total",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).hintColor,
                      ),
                    )),
                    DataCell(dataTablepriceBeautify(finalPrice.toString())),
                  ]),
                ],
              ),
              InkWell(
                onTap: ()async {
                  // newbooking();
                  Booking newbooking = Booking(
                      bookingdate: DateTime.now().toString(),
                      bookingid:
                          DateTime.now().millisecondsSinceEpoch.toString(),
                      checkin:
                          widget.checkIn!,
                      checkout:
                          widget.checkOut!,
                      bookingprice: finalPrice.toDouble(),
                      guests: widget.guests,
                      numberofdays: widget.numberofdays,
                      userid: widget.userid.toString(),
                      houseid: widget.houseid.toString());
                  // print(
                  //   DateFormat.yMEd().format(widget.checkIn!).toString() +
                  //       DateFormat.yMEd().format(widget.checkOut!).toString(),
                  // );
                  final bookingstate = Provider.of<BookingProvider>(context,listen: false);
                  showSnackbarCustom(context, "Booking confirmed successful",
                      Colors.green);
                  bookingstate.bookhouse(newbooking);
                  AppNotifications appNotifications = new AppNotifications();
                await appNotifications .showNotification(widget.checkIn!,'Booking confirmed successfully').whenComplete((){
                  print('Notification sent');
                });
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text('Pay'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
