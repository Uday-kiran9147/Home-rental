// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:houserental/utils/notifications.dart';
import 'app/myapp.dart';

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

  runApp(MyApp());
}
