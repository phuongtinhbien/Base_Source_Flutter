import 'package:package_info/package_info.dart';

class PackageService{
  static PackageService _instance;
  static PackageInfo packageInfo;
  static Future<PackageService> getInstance() async {
    if (_instance == null) {
      _instance = PackageService();
    }
    return _instance;
  }

  static initalize() async {
    if (_instance == null) {
      _instance = PackageService();
      if (packageInfo == null) {
        packageInfo = await PackageInfo.fromPlatform();
      }
    }
  }


}