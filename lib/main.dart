import 'package:expense_tracking/features/home/home_page.dart';
import 'package:expense_tracking/features/login/login_page.dart';
import 'package:expense_tracking/features/main/main_page.dart';
import 'package:expense_tracking/features/splash/splash_page.dart';
import 'package:expense_tracking/services/device_info_service.dart';
import 'package:expense_tracking/themes/theme.dart';
import 'package:expense_tracking/trans/translations.dart';
import 'package:expense_tracking/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceInfoService.configure();
  AppTheme.configure(ThemeName.DARK);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        Translations.delegate
      ],
      locale: Locale.fromSubtags(languageCode: "en"),
      supportedLocales: [
        Locale.fromSubtags(
          languageCode: 'vi',
        ),
        Locale.fromSubtags(
          languageCode: 'en',
        ),
      ],
      theme: AppTheme().appTheme,
      home: MainPage(),
      initialRoute: SPLASH_SCREEN,
      routes: {
        SPLASH_SCREEN: (context) => SplashPage(),
        HOME_SCREEN: (context) => HomePage(),
        LOGIN_SCREEN: (context) => LoginPage(),
      },
    );
  }
}
