import 'dart:io';

import 'package:expense_tracking/services/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseMessageService {
  FirebaseMessaging _firebaseMessaging;
  static FirebaseMessageService _instance;

  FirebaseMessageService() {
    _firebaseMessaging = FirebaseMessaging();
    configlistener();
  }

  void configlistener() {
    //Require IOS Permisstion
    if (Platform.isIOS) requestIOSPermission();
//  flutterLocalNotificationsPlugin.initialize(initializationSettings,
//      onSelectNotification: onSelectNotification);
//    _firstStart();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        if (kDebugMode) {
          print("FIREBASE_MESSAGE_onMessage: " + message.toString());
        }
        await LocalNotificationService.show(
          id: 0,
          title: message["notification"]["title"],
          body: message["notification"]["body"],
        );

//        _addBadge();
      },
      onResume: (Map<String, dynamic> message) async {
        if (kDebugMode) {
          print("FIREBASE_MESSAGE_onResume: " + message.toString());
        }
        await LocalNotificationService.show(
          id: 0,
          title: message["notification"]["title"],
          body: message["notification"]["body"],
        );

//        _removeBadge();
      },
      onLaunch: (Map<String, dynamic> message) async {
        if (kDebugMode) {
          print("FIREBASE_MESSAGE_onLaunch: " + message.toString());
        }
        await LocalNotificationService.show(
          id: 0,
          title: message["notification"]["title"],
          body: message["notification"]["body"],
        );

//        _removeBadge();
      },
    );
  }

  static Future<FirebaseMessageService> getInstance() async {
    if (_instance == null) {
      _instance = FirebaseMessageService();
    }
    return _instance;
  }

  static initalize() {
    if (_instance == null) {
      _instance = FirebaseMessageService();
    }
  }

  void requestIOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      if (kDebugMode) {
        print("Settings registered: $settings");
      }
    });
  }

//  _firstStart() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    bool firstTime = prefs.getBool(SharefKey.FIRST_TIME_LOGINED) ?? true;
//    if (firstTime) {
//      _firebaseMessaging.getToken().then((token) {
//        if (kDebugMode) {
//          print("Device token: " + token);
//        }
//        _storeDeviceToken(token);
//      });
//      await prefs.setBool(SharefKey.FIRST_TIME_LOGINED, true);
//    }
//  }
//
//  _storeDeviceToken(String token) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    await prefs.setString(SharefKey.DEVICE_TOKEN, token);
//  }
}
