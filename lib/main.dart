// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:houserental/utils/device_info.dart';
import 'package:houserental/utils/notifications.dart';
import 'package:provider/provider.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/provider/booking.dart';
import 'package:houserental/screens/house_detail_screen.dart';
import 'package:houserental/screens/ownhouse_screen.dart';
import 'package:houserental/screens/renthouse_screen.dart';
import 'package:houserental/widgets/forms/filldetails.dart';
import 'auth/userform.dart';
import 'screens/home_screen.dart';
import 'utils/shared_prefs.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the local notifications plugin
  AppNotifications appNotifications = new AppNotifications();
  
  await appNotifications.flutterLocalNotificationsPlugin.initialize(
    appNotifications.initializationSettings,
    onSelectNotification: (String? payload) async {
      // Handle notification click
      print('onSelectNotification $payload');
    },
  );

  runApp(MyApp(
    
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    // required this.flutterLocalNotificationsPlugin,
  }) : super(key: key);
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isloggedin = false;
  @override
  void initState() {
    // getuserLoggedinStatus();

    // get the android/ios device information.
    initializeDeviceInfo(context).then((value) {
      print(value);
    });
    super.initState();
  }

  getuserLoggedinStatus() async {
    SHP.getUserLoggedinStatusSP().then((value) {
      setState(() {
        isloggedin = value;
      });
    });

    if (isloggedin == null) {
      setState(() {
        isloggedin = false;
      });
    }
  }

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
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 207, 184, 9)),
        ),
        home: /* isloggedin!? */ const MyHomePage(), //: const Login(),
        routes: {
          '/home': (context) => const MyHomePage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignupPage(),
          HouseDetailScreen.routeName: (context) => const HouseDetailScreen(),
          // PaymentScreen.routeName: (context) => PaymentScreen(),
          // HousePaymentDetailsScreen.routeName:(context) => HousePaymentDetailsScreen()
          RentHouses.routeName: (context) => const FillHouseDetails(),
          OwnHousePage.ownHouseRoute: (context) => const OwnHousePage(),
        },
      ),
    );
  }
}
