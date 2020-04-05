import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservationroomapp/blocs/authentication/authentication_bloc.dart';
import 'package:reservationroomapp/blocs/authentication/authentication_event.dart';
import 'package:reservationroomapp/myapp.dart';
import 'package:reservationroomapp/services/mock/mock_user_service.dart';
import 'package:reservationroomapp/services/real/user_service.dart';
import 'package:reservationroomapp/services/rest_client.dart';

class SimpleBlocDelegate extends BlocDelegate {
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

// ref: implement bloc https://github.com/felangel/bloc/blob/8b10f0519e/examples/flutter_login/lib/main.dart

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final rest = RestClient();
  final userSvc = MockUserService();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userService: userSvc)..add(AppStarted());
      },
      child: MyApp(userSvc: userSvc),
    ),
  );
}
