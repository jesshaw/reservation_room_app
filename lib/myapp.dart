import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservationroomapp/blocs/authentication/authentication_bloc.dart';
import 'package:reservationroomapp/blocs/authentication/authentication_state.dart';
import 'package:reservationroomapp/blocs/tab/bloc.dart';
import 'package:reservationroomapp/pages/counter_page.dart';
import 'package:reservationroomapp/pages/home_page.dart';
import 'package:reservationroomapp/pages/login/login_page.dart';
import 'package:reservationroomapp/pages/profile/profile_body.dart';
import 'package:reservationroomapp/pages/splash_page.dart';
import 'package:reservationroomapp/services/abstract/user_service.dart';
import 'package:reservationroomapp/widgets/loading_indicator.dart';

class MyApp extends StatelessWidget {
  final UserService userSvc;

  MyApp({Key key, @required this.userSvc}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: 'Reservation Room App',
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
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<TabBloc>(
                  create: (context)=>TabBloc(),
                )
              ],
              child: HomePage(),
            );
          }

          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userService: userSvc);
          }

          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
//    home: HomePage(title: 'Reservation Room Home Page!'),
//    home: BlocProvider<IncrementBloc>(
//      bloc: IncrementBloc(),
//      child: CounterPage(),
//    ),
//    home: LoginPage(),
//    home: ProfilePage(),
//      routes: <String, WidgetBuilder>{
//        "home page": (BuildContext context) => HomePage(),
//        "counter page": (BuildContext context) => CounterPage(),
//        "login page": (BuildContext context) => LoginPage(),
//        "profile page": (BuildContext context) => ProfileBody(),
//      },
    );
  }
}
