import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservationroomapp/services/abstract/hotel_service.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelService hotelService;

  HotelBloc({@required this.hotelService});

  @override
  HotelState get initialState => HotelUninitialized();

  @override
  Stream<HotelState> transformEvents(Stream<HotelEvent> events,
      Stream<HotelState> next(HotelEvent event)) {
    return super.transformEvents(
        (events as Observable<HotelEvent>)
            .debounceTime(const Duration(microseconds: 500)),
        next);
  }

  @override
  Stream<HotelState> mapEventToState(HotelEvent event,) async* {
    final currentState = state;

    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        int size = 10;
        if (currentState is HotelUninitialized) {
          final result = await hotelService.search(
              destination: 'shanghai',
              start: DateTime.parse("20200408"),
              end: DateTime.parse("20200409"),
              page: 0,
              size: size);
          yield HotelLoaded(hotels: result.content, hasReachedMax: false);
          return;
        }
        if (currentState is HotelLoaded) {
          final result = await hotelService.search(
              destination: 'shanghai',
              start: DateTime.parse("20200408"),
              end: DateTime.parse("20200409"),
              page: (currentState.hotels.length / size).floor(),
              size: size);
          yield currentState.copyWith(
              hotels: currentState.hotels + result.content,
              hasReachedMax: result.content.isEmpty ||
                  result.content.length < size);
        }
      } catch (_) {
        yield HotelError();
      }
    }
  }

  bool _hasReachedMax(HotelState state) =>
      state is HotelLoaded && state.hasReachedMax;
}
