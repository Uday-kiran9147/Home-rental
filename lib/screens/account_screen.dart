import 'package:flutter/material.dart';
import 'package:houserental/provider/booking.dart';
import 'package:houserental/services/apiservice.dart';
import 'package:houserental/utils/pricebeautify.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final bookingprovider = Provider.of<BookingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        actions: [
          Tooltip(
            message: "Logout",
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // Handle logout here
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Current Bookings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Change text color to blue
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: ApiService.fetchbookings(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber, // Change progress color to amber
                      ),
                    );
                  } else if (ApiService.data.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Bookings",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey, // Change text color to grey
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: ApiService.data.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 3,
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking Date: ${DateFormat.yMd().format(DateTime.parse(ApiService.data[index]["bookingdate"]))}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Check-in: ${ApiService.data[index]["checkin"].toString().trim()}',
                              ),
                              Text(
                                'Check-out: ${ApiService.data[index]["checkout"]}',
                              ),
                              Text(
                                'Guests: ${ApiService.data[index]["guests"]}',
                              ),
                              Text(
                                'Days: ${ApiService.data[index]["numberofdays"]}',
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Price: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  dataTablepriceBeautify(
                                    ApiService.data[index]["bookingprice"]
                                        .toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
