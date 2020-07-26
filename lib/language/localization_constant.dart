import 'package:flutter/cupertino.dart';
import 'package:rolling_international/localization/language_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key) {
  return LanguageLocalization.of(context).getTranslatedValue(key);
}

const String English = 'en';
const String Nepali = 'ne';
const String LANGUAGE_CODE = 'languageCode';
Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case English:
      _temp = Locale(languageCode, 'US');
      break;
    case Nepali:
      _temp = Locale(languageCode, 'NP');
      break;
    default:
      _temp = Locale(languageCode, 'US');
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String lanuageCode = _prefs.getString(LANGUAGE_CODE) ?? English;
  return _locale(lanuageCode);
}
