import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

///usage:
///Translations.of(context).text('bottom_bar_label_home'),
class Translations {
  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<Translations> load(Locale locale) async {
    Translations translations = new Translations(locale);
    String availableCode = getAvailableCode(locale);
    String jsonContent =
    await rootBundle.loadString("assets/strings/intl_$availableCode.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  static String getAvailableCode(Locale locale) {
    String availableCode = locale.languageCode;
    if (locale.countryCode.isNotEmpty) {
      availableCode = "${locale.languageCode}_${locale.countryCode}";
    }
    return availableCode;
  }

  get currentLanguage => locale.languageCode;
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => [
    Locale.fromSubtags(
      languageCode: 'vi',
      countryCode: 'VN',
    ),
    Locale.fromSubtags(
      languageCode: 'en',
    ),
  ].contains(locale);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}
