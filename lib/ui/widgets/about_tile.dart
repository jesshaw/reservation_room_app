import 'package:flutter/material.dart';

class MyAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      applicationIcon: FlutterLogo(
        colors: Colors.yellow,
      ),
      icon: FlutterLogo(
        colors: Colors.yellow,
      ),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Developed By Pawan Kumar",
        ),
        Text(
          "MTechViral",
        ),
      ],
      applicationName: "reservation room",
      applicationVersion: "1.0.1",
      applicationLegalese: "Apache License 2.0",
    );
  }
}
