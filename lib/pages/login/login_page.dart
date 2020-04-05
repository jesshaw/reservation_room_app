import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservationroomapp/blocs/authentication/authentication_bloc.dart';
import 'package:reservationroomapp/blocs/login/bloc.dart';
import 'package:reservationroomapp/pages/login/login_body.dart';
import 'package:reservationroomapp/services/abstract/user_service.dart';

class LoginPage extends StatelessWidget {
  final UserService userService;

  LoginPage({Key key, @required this.userService})
      : assert(userService != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userService: userService,
          );
        },
        child: Center(
          child: LoginBody(),
        ),
      ),
    );
  }
}
