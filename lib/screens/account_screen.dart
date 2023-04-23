import 'package:flutter/material.dart';
import 'package:houserental/provider/booking.dart';
import 'package:houserental/services/apiservice.dart';
import 'package:houserental/utils/pricebeautify.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  ApiService apiService = new ApiService();

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  final colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );
  @override
  Widget build(BuildContext context) {
    final bookingprovider = Provider.of<BookingProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Text("Current Booking\'s"),
          SizedBox(
            height: 170,
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Current Booking\'s',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
          FutureBuilder(
            future: ApiService.fetchbookings(),
            builder: (context, snapshot) => Expanded(
              child: snapshot.connectionState == ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator(color: Colors.amber,))
                  : ListView.builder(
                      itemCount: ApiService.data.length,
                      itemBuilder: (context, index) => Card(
                        color: Colors.grey.shade300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            dataTablepriceBeautify(ApiService.data[index]
                                    ["bookingprice"]
                                .toString()),
                            Text(
                                "BookingDate: ${ApiService.data[index]["bookingdate"]}"),
                            Text(
                                "Check-in: ${ApiService.data[index]["checkin"].toString().trim()}"),
                            Text(
                                "Check-out: ${ApiService.data[index]["checkout"]}"),
                            Text(
                                "Guest\'s: ${ApiService.data[index]["guests"]}"),
                            Text(
                                "days: ${ApiService.data[index]["numberofdays"]}"),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
