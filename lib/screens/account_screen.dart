import 'package:flutter/material.dart';
import 'package:houserental/provider/booking.dart';
import 'package:houserental/services/apiservice.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final bookingprovider = Provider.of<BookingProvider>(context);
    return Scaffold(
      body: FutureBuilder(
        future: ApiService.fetchbookings(),
        builder: (context, snapshot) => ListView.builder(
          itemCount: bookingprovider.bookinglistgetter.length,
          itemBuilder: (context, index) =>
              Card(child: Text('${snapshot.data![index].bookingprice}')),
        ),
      ),
    );
  }
}
