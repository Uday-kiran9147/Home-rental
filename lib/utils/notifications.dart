import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class AppNotifications {

  // initialize notification service
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings(
          'mipmap/ic_launcher'); // Replace 'app_icon' with your app's launcher icon
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);


  // show notification
  Future<void> showNotification(DateTime checkinDate, String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      // color: Colors.amber,
      'House_Rentals_Notifications', // Replace 'your_channel_id' with a unique channel ID
      'House_Rentals', // Replace 'Your Channel Name' with a channel name
      channelDescription:
          'Your Channel Description', // Replace 'Your Channel Description' with a channel description
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Replace 'Your Notification Title' and 'Your Notification Body' with actual content
    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID (must be unique within your app)
      'Booking Confirmed',
      'Your booking is confirmed for ${DateFormat.yMMMd().format(checkinDate)}',
      platformChannelSpecifics,
      payload: 'notification is tapped',
    );
  }
}
