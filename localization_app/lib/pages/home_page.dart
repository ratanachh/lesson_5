import 'package:app/localization/localization_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate(context, 'welcome')),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            child: Text(translate(context, 'click')),
            onPressed: () {
              changeLanguage(context, 'en');
            }
          ),
          RaisedButton(
            child: Text(translate(context, 'change')),
            onPressed: () {
              changeLanguage(context, 'km');
            }
          ),
        ],
      ),
    );
  }
}