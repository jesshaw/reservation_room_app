import 'package:equatable/equatable.dart';

abstract class HotelEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetch extends HotelEvent {
  get destination => null;

  get startDate => null;

  get endDate => null;
}
