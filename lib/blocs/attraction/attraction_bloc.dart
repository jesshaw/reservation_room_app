import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AttractionBloc extends Bloc<AttractionEvent, AttractionState> {
  @override
  AttractionState get initialState => InitialAttractionState();

  @override
  Stream<AttractionState> mapEventToState(
    AttractionEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
