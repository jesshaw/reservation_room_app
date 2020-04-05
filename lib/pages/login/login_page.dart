import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservationroomapp/blocs/login/bloc.dart';
import 'package:reservationroomapp/pages/login/login_form.dart';
import 'package:reservationroomapp/services/abstract/user_service.dart';

class LoginPage extends StatelessWidget {
  final UserService userService;

  LoginPage({Key key, @required this.userService})
      : assert(userService != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userService: userService),
        child: LoginForm(userService: userService),
      ),
    );
  }
}
