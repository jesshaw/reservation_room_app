import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:reservationroomapp/logic/bloc/bloc_provider.dart';
import 'package:reservationroomapp/logic/bloc/increment_bloc.dart';
import 'package:reservationroomapp/ui/pages/counter_page.dart';
import 'package:reservationroomapp/ui/pages/home_page.dart';
import 'package:reservationroomapp/ui/pages/login/login_page.dart';
import 'package:reservationroomapp/ui/pages/profile/profile_page.dart';

class SimpleBlocDelegate extends BlocDelegate{

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

// TODO: implement bloc https://github.com/felangel/bloc/blob/8b10f0519e/examples/flutter_login/lib/main.dart
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
    home: BlocProvider<IncrementBloc>(
      bloc: IncrementBloc(),
      child: CounterPage(),
    ),
//    home: LoginPage(),
//    home: ProfilePage(),
    routes: <String, WidgetBuilder>{
      "home page": (BuildContext context) => HomePage(),
      "counter page": (BuildContext context) => CounterPage(),
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
