import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LanguageLocalization {
  final Locale locale;
  LanguageLocalization(this.locale);

  static LanguageLocalization of(BuildContext context) {
    return Localizations.of<LanguageLocalization>(
        context, LanguageLocalization);
  }

  Map<String, String> _localizedValues;
  Future load() async {
    String jsonStringValues =
        await rootBundle.loadString('lib/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValue(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<LanguageLocalization> delegate =
      _LanguageLocalizationDelegate();
}

class _LanguageLocalizationDelegate
    extends LocalizationsDelegate<LanguageLocalization> {
  const _LanguageLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ne'].contains(locale.languageCode);
  }

  @override
  Future<LanguageLocalization> load(Locale locale) async {
    LanguageLocalization localization = new LanguageLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_LanguageLocalizationDelegate old) => false;
}
