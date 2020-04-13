import 'package:equatable/equatable.dart';
import 'package:reservationroomapp/models/attraction.dart';

abstract class AttractionState extends Equatable {
  const AttractionState();

  @override
  List<Object> get props => [];
}


class AttractionUninitialized extends AttractionState {}

class AttractionError extends AttractionState {}

class AttractionLoaded extends AttractionState {
  final List<Attraction> attractions;
  final bool hasReachedMax;

  const AttractionLoaded({this.attractions, this.hasReachedMax});

  AttractionLoaded copyWith({List<Attraction> attractions, bool hasReachedMax}) {
    return AttractionLoaded(
      attractions: attractions ?? this.attractions,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [attractions, hasReachedMax];

  @override
  String toString() {
    return 'AttractionLoaded{hotels: ${attractions.length}, hasReachedMax: $hasReachedMax}';
  }
}