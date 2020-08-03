import 'package:expense_tracking/themes/color_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ThemeName { DARK, LIGHT }

class AppTheme {
  static final AppTheme _singleton = new AppTheme._internal();
  static ThemeName _themeName = ThemeName.LIGHT;

  factory AppTheme() {
    return _singleton;
  }

  AppTheme._internal();

  static void configure(ThemeName themeName) {
    _themeName = themeName;
  }

  ThemeData get appTheme {
    switch (_themeName) {
      case ThemeName.DARK:
        return _buildDarkTheme();
      default: // Flavor.PRO:
        return _buildLightTheme();
    }
  }

  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      // ignore: deprecated_member_use
      title: base.title.copyWith(
        // ignore: deprecated_member_use
        fontFamily: 'GoogleSans',
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    const Color primaryColor = const Color(0xFF3B3B48);
    final ThemeData base = new ThemeData.dark();
    return base.copyWith(
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: const Color(0xFF3F3F4C),
      accentColor: ColorStyle.blue,
      canvasColor: const Color(0xFF2B2B2B),
      scaffoldBackgroundColor: const Color(0xFF2E2E3B),
      backgroundColor: const Color(0xFF2E2E3B),
      errorColor: ColorStyle.red,
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
        appBarTheme: AppBarTheme(

            textTheme: TextTheme(
                title: GoogleFonts.poppins(
                    color: ColorStyle.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                )
            )
        )
    );
  }

  ThemeData _buildLightTheme() {
    Color primaryColor = ColorStyle.blue;
    final ThemeData base = new ThemeData.light();
    return base.copyWith(
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: ColorStyle.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: ColorStyle.blue,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      errorColor: ColorStyle.red,


      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        textTheme: TextTheme(
          title: GoogleFonts.poppins(
              color: ColorStyle.dark,
              fontSize: 16.0,
              fontWeight: FontWeight.bold
          )
        )
      )
    );
  }

}
