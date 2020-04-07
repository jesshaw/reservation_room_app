import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:reservationroomapp/models/app_tab.dart';

import './bloc.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.hotels;

  @override
  Stream<AppTab> mapEventToState(
    TabEvent event,
  ) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
