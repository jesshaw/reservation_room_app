import 'package:flutter/material.dart';
import 'package:reservation_room_app/ui/pages/home_page.dart';
import 'package:reservation_room_app/ui/pages/login/login_page.dart';
import 'package:reservation_room_app/ui/pages/profile/profile_page.dart';

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
    title: 'Reservation Room App',
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.blue,
    ),
//    home: HomePage(title: 'Reservation Room Home Page!'),
    home: LoginPage(),
//    home: ProfilePage(),
    routes: <String, WidgetBuilder>{
      "home page": (BuildContext context) => HomePage(),
      "login page": (BuildContext context) => LoginPage(),
      "profile page": (BuildContext context) => ProfilePage(),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
