import 'package:equatable/equatable.dart';
import 'package:reservationroomapp/models/hotel.dart';

abstract class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

class HotelUninitialized extends HotelState {}

class HotelError extends HotelState {}

class HotelLoaded extends HotelState {
  final List<Hotel> hotels;
  final bool hasReachedMax;

  const HotelLoaded({this.hotels, this.hasReachedMax});

  HotelLoaded copyWith({List<Hotel> hotels, bool hasReachedMax}) {
    return HotelLoaded(
      hotels: hotels ?? this.hotels,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [hotels, hasReachedMax];

  @override
  String toString() {
    return 'HotelLoaded{hotels: ${hotels.length}, hasReachedMax: $hasReachedMax}';
  }
}
