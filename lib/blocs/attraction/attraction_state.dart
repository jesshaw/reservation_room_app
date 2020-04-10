import 'package:equatable/equatable.dart';

abstract class AttractionState extends Equatable {
  const AttractionState();
}

class InitialAttractionState extends AttractionState {
  @override
  List<Object> get props => [];
}
