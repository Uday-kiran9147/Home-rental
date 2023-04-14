import 'package:flutter/material.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/provider/booking.dart';
import 'package:houserental/screens/house_detail_screen.dart';
import 'package:houserental/screens/renthouse_screen.dart';
import 'package:houserental/widgets/forms/filldetails.dart';
import 'package:provider/provider.dart';
import 'auth/login.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyAppState()),
        ChangeNotifierProvider(create: (context) => BookingProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home-Rent',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 207, 184, 9)),
        ),
        home: SafeArea(child: Login()),
        routes: {
          // '/':(context) => HomeImplement(),
          HouseDetailScreen.routeName: (context) => HouseDetailScreen(),
          // PaymentScreen.routeName: (context) => PaymentScreen(),
          // HousePaymentDetailsScreen.routeName:(context) => HousePaymentDetailsScreen()
          RentHouses.routeName:(context) => FillHouseDetails()
        },
      ),
    );
  }
}
