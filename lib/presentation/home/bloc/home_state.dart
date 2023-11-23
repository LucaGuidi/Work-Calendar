part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Day>? days;

  const HomeState({
    this.days,
  });

  HomeState copyWith({
    List<Day>? days,
  }) {
    return HomeState(
      days: days ?? this.days,
    );
  }

  @override
  List<Object?> get props => [
        days,
      ];
}
