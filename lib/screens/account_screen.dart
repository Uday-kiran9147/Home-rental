import 'package:flutter/material.dart';
import 'package:houserental/provider/booking.dart';
import 'package:houserental/services/apiservice.dart';
import 'package:houserental/utils/pricebeautify.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  ApiService apiService = new ApiService();
  @override
  Widget build(BuildContext context) {
    final bookingprovider = Provider.of<BookingProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Text("Current Bookings"),
          FutureBuilder(
            future: ApiService.fetchbookings(),
            builder: (context, snapshot) => Expanded(
              child: ListView.builder(
                itemCount: ApiService.data.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.grey.shade500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dataTablepriceBeautify(ApiService.data[index]["bookingprice"].toString()),
                      Text(
                          "BookingDate: ${ApiService.data[index]["bookingdate"]}"),
                      Text(
                          "Check-in: ${ApiService.data[index]["checkin"].toString().trim()}"),
                      Text("Check-out: ${ApiService.data[index]["checkout"]}"),
                      Text("Guest\'s: ${ApiService.data[index]["guests"]}"),
                      Text("days: ${ApiService.data[index]["numberofdays"]}"),
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
