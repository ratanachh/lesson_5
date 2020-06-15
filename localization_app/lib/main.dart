import 'package:app/localization/app_localizations.dart';
import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(LocalizationApp());
}

class LocalizationApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale locale) {
    _LocalizationAppState state = context.findRootAncestorStateOfType<_LocalizationAppState>();
    state.setLocale(locale);
  }
  // This widget is the root of your application.

  @override
  _LocalizationAppState createState() => _LocalizationAppState();
}

class _LocalizationAppState extends State<LocalizationApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('km', 'KH')
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.countryCode == locale.countryCode &&
            supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
        }
        return supportedLocales.first;
      },
      locale: _locale,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage()
      }
    );
  }
}