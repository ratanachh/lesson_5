
import 'package:app/localization/app_localizations.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';

String translate (BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}

void changeLanguage(BuildContext context,String languageCode) {
  Locale _tmp;
  switch(languageCode) {
    case 'en':
      _tmp = Locale(languageCode, 'US');
      break;
    case 'km':
      _tmp = Locale(languageCode, 'KH');
      break;
    default:
      _tmp = Locale(languageCode, 'US');
      break;
  }
  LocalizationApp.setLocale(context, _tmp);
}