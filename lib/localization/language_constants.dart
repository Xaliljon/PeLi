import 'package:flutter/material.dart';
import 'package:peli/localization/demo_localizations.dart';
import 'package:peli/utils/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LANGUAGE_CODE = 'languageCode';

//languages code
const String UZBEK = 'uz';
const String RUSSIAN = 'ru';
const String KIRILL = 'en';

Future<Locale> setLocale(String languageCode) async {
  UserData _userData = UserData();
  _userData.setLang(languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? "uz";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case UZBEK:
      return Locale(UZBEK, 'UZ');
    case RUSSIAN:
      return Locale(RUSSIAN, "RU");
    case KIRILL:
      return Locale(KIRILL, "EN");
    default:
      return Locale(UZBEK, 'UZ');
  }
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context)!.translate(key);
}
