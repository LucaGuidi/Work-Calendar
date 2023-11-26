part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class InitialDatePicked extends HomeEvent {
  InitialDatePicked(this.initialDate);
  final DateTime initialDate;

  @override
  List<Object?> get props => [initialDate];
}

class FinalDatePicked extends HomeEvent {
  FinalDatePicked(this.finalDate);
  final DateTime finalDate;

  @override
  List<Object?> get props => [finalDate];
}