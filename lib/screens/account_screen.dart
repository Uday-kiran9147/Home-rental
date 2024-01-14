import 'package:flutter/material.dart';
import 'package:houserental/models/booking.dart';
import 'package:houserental/screens/ownhouse_screen.dart';
import 'package:intl/intl.dart';

import 'package:houserental/utils/pricebeautify.dart';

import 'bookings_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class ProfileSections {
  final String title;
  final IconData icon;
  final Function(BuildContext) onPressed;
  ProfileSections(
      {required this.title, required this.icon, required this.onPressed});
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    // final bookingprovider = Provider.of<BookingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          Tooltip(
            message: "Logout",
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text(
                  'Uday',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                subtitle: const Text('Show profile'),
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJgKkiwYzoFNUOA3HUK-xHfoEnCcRd7emMZQ&usqp=CAU'),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16),
              const ProfileHeadLine(title: "Settings"),
              Column(
                children: settings
                    .map((settingName) => ListTile(
                          title: Text(settingName.title),
                          leading: Icon(
                            settingName.icon,
                            size: 20,
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                          ),
                          onTap: () => settingName.onPressed(context),
                          dense: true,
                          enabled: true,
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16),
              const ProfileHeadLine(title: "Hosting"),
              const SizedBox(height: 16),
              const ListTile(
                title: Text('Switching to Hosting'),
                dense: true,
                enabled: true,
              ),
              const ProfileHeadLine(title: "Leagal"),
              Column(
                children: legal
                    .map((legalName) => ListTile(
                          title: Text(legalName.title),
                          leading: Icon(
                            legalName.icon,
                            size: 20,
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                            ),
                            onPressed: () {},
                          ),
                          dense: true,
                          enabled: true,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      )),
    );
  }

  List<ProfileSections> legal = [
    ProfileSections(
      title: 'Terms of Service',
      icon: Icons.safety_check,
      onPressed: (context) {},
    ),
    ProfileSections(
      title: 'Privacy Policy',
      icon: (Icons.privacy_tip_outlined),
      onPressed: (context) {},
    ),
    ProfileSections(
      title: 'Trust & Safety',
      icon: (Icons.safety_check),
      onPressed: (context) {},
    ),
  ];

  List<ProfileSections> settings = [
    ProfileSections(
      title: 'Personal information',
      icon: (Icons.account_circle_outlined),
      onPressed: (context) {},
    ),
    ProfileSections(
      title: 'My Properties',
      icon: (Icons.home_rounded),
      onPressed: (context) {
        Navigator.pushNamed(context, OwnHousePage.ownHouseRoute);
      },
    ),
    ProfileSections(
      title: 'My Bookings',
      icon: Icons.bookmark_added_outlined,
      onPressed: (context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BookingsScreen()));
      },
    ),
    ProfileSections(
      title: 'Login & Security',
      icon: (Icons.logout_outlined),
      onPressed: (context) {},
    ),
    ProfileSections(
      title: 'Payments and Payouts',
      icon: (Icons.payments_outlined),
      onPressed: (context) {},
    ),
    ProfileSections(
      title: 'Accessibility',
      icon: (Icons.accessibility),
      onPressed: (context) {},
    ),
    ProfileSections(
      title: 'Notifications',
      icon: (Icons.notifications),
      onPressed: (context) {},
    ),
  ];
}

class ProfileHeadLine extends StatelessWidget {
  const ProfileHeadLine({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }
}



class BookingCardWidget extends StatelessWidget {
  BookingCardWidget({super.key, required this.booking});
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Date: ${DateFormat.yMd().format(DateTime.parse(DateTime.now().toString()))}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Check-in: ${booking.checkin}',
            ),
            Text(
              'Check-out: ${booking.checkout}',
            ),
            Text(
              'Guests: ${booking.guests}',
            ),
            Text(
              'Days: ${booking.numberofdays}',
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Price: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                dataTablepriceBeautify(booking.bookingprice.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
