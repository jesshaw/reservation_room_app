import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservationroomapp/blocs/authentication/authentication_bloc.dart';
import 'package:reservationroomapp/blocs/authentication/authentication_event.dart';
import 'package:reservationroomapp/services/abstract/user_service.dart';

import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserService userService;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.userService, @required this.authenticationBloc})
      : assert(userService != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final token = await userService.authenticate(
            username: event.username, password: event.password);
        authenticationBloc.add(LoggedIn(token: token.content));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
