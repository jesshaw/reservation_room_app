import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservationroomapp/services/abstract/user_service.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserService _userService;

  LoginBloc({
    @required UserService userService,
  })  : assert(userService != null),
        _userService = userService;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> transformEvents(
    Stream<LoginEvent> events,
    Stream<LoginState> Function(LoginEvent event) next,
  ) {
    final Observable<LoginEvent> nonDebounceStream = events.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });

    final Observable<LoginEvent> debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    });

    debounceStream.debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      next,
    );
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
//    yield state.update(
//      isEmailValid: Validators.isValidEmail(email),
//    );
    yield state.update(
      isEmailValid: true,
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
//    yield state.update(
//      isPasswordValid: Validators.isValidPassword(password),
//    );

    yield state.update(
      isEmailValid: true,
    );
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      await _userService.signInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      final authResult =
          await _userService.authenticate(username: email, password: password);
      if (authResult.success) {
        yield LoginState.success(token: authResult.content);
      }
      yield LoginState.failure();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
