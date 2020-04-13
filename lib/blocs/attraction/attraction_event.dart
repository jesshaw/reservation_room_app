import 'package:equatable/equatable.dart';

abstract class AttractionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAttraction extends AttractionEvent {
  get destination => null;

  get startDate => null;

  get endDate => null;
}
