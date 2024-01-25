import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
  
  Future<Map<String, dynamic>> initializeDeviceInfo(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

        return {
          'id': androidInfo.id,
          'platform': 'Android',
          'device': androidInfo.device,
          'model': androidInfo.model,
          'version': androidInfo.version.release,
        };
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return {
          'id': iosInfo.identifierForVendor,
          'platform': 'iOS',
          'device': iosInfo.utsname.machine,
          'model': iosInfo.model,
          'version': iosInfo.systemVersion,
        };
      }
    } catch (e) {
      print('Error getting device information: $e');
    }

    return {};
  }