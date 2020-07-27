import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfoService {
  static DeviceInfoPlugin _instance;
  static AndroidDeviceInfo _androidInfo;
  static IosDeviceInfo _iosInfo;

  static final DeviceInfoService _singleton = new DeviceInfoService._internal();

  DeviceInfoService._internal();

  factory DeviceInfoService() {
    configure();
    return _singleton;
  }

  static void configure() async {
    if (_instance == null) {
      _instance = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        if (_androidInfo == null) {
          _androidInfo = await _instance.androidInfo;
        }
      }
      if (Platform.isIOS) {
        if (_iosInfo == null) {
          _iosInfo = await _instance.iosInfo;
        }
      }
    }
  }

  static DeviceInfoPlugin get deviceInfo {
    return _instance;
  }

  AndroidDeviceInfo get androidDeviceInfo {
    return _androidInfo;
  }

  IosDeviceInfo get iosDeviceInfo {
    return _iosInfo;
  }


}
