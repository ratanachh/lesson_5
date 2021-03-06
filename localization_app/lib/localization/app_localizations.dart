
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations
{
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of (BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const _AppLocalizationDelegate delegate =  _AppLocalizationDelegate();

  Map<String, String> _localizedString;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('lang/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedString = jsonMap.map((key, value){
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizedString[key];
  }

}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations>
{

  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'km'].contains(locale.languageCode);
  }
  
  @override
  Future<AppLocalizations> load(Locale locale)  async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
  
}