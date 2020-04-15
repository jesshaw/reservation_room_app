import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservationroomapp/services/abstract/attraction_service.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class AttractionBloc extends Bloc<AttractionEvent, AttractionState> {
  final AttractionService attractionService;

  AttractionBloc({@required this.attractionService});

  @override
  AttractionState get initialState => AttractionUninitialized();

  @override
  Stream<AttractionState> transformEvents(Stream<AttractionEvent> events,
      Stream<AttractionState> next(AttractionEvent event)) {
    return super.transformEvents(
        (events as Observable<AttractionEvent>)
            .debounceTime(const Duration(microseconds: 500)),
        next);
  }

  @override
  Stream<AttractionState> mapEventToState(
    AttractionEvent event,
  ) async* {
    final currentState = state;

    if (event is FetchAttraction && !_hasReachedMax(currentState)) {
      try {
        int size = 10;
        if (currentState is AttractionUninitialized) {
          final result =
              await attractionService.fetch(cityId: 1, page: 0, size: size);
          yield AttractionLoaded(
              attractions: result.content, hasReachedMax: false);
          return;
        }
        if (currentState is AttractionLoaded) {
          final result =
              await attractionService.fetch(cityId: 1, page: (currentState.attractions.length / size).floor(), size: size);
          yield currentState.copyWith(
              attractions: currentState.attractions + result.content,
              hasReachedMax:
                  result.content.isEmpty || result.content.length < size);
        }
      } catch (_) {
        yield AttractionError();
      }
    }
  }

  bool _hasReachedMax(AttractionState state) =>
      state is AttractionLoaded && state.hasReachedMax;
}
