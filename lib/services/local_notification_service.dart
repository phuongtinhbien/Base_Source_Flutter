import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  static AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("@mipmap/launcher_icon");

  static IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  static InitializationSettings initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);

  static NotificationDetails platformChannelSpecifics;

  static initalize() async {
    if (flutterLocalNotificationsPlugin == null) {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      var result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );

      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          importance: Importance.Max,
          priority: Priority.High,
          channelShowBadge: true,
          ticker: 'ticker');
      var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );
      platformChannelSpecifics = NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: onSelectNotification);
    }
  }

  static Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  static Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
  }

  static Future show(
      {int id, String title, String body, String payload}) async {
    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: payload);
  }
}
