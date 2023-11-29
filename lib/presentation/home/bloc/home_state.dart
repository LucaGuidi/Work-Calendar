part of 'home_bloc.dart';

enum HomeStatus { ready, loading, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final String failureMessage;
  final List<Day>? days;
  final DateTime? initialDate;
  final DateTime? finalDate;

  final int? workingDays;

  bool get showFinalDate => initialDate != null;
  bool get showWorkingDays => finalDate != null && workingDays != null;

  const HomeState({
    this.status = HomeStatus.ready,
    this.failureMessage = '',
    this.days,
    this.initialDate,
    this.finalDate,
    this.workingDays,
  });

  HomeState copyWith({
    HomeStatus? status,
    String? failureMessage,
    List<Day>? days,
    DateTime? initialDate,
    DateTime? Function()? finalDate,
    int? Function()? workingDays,
  }) {
    return HomeState(
      status: status ?? this.status,
      failureMessage: failureMessage ?? this.failureMessage,
      days: days ?? this.days,
      initialDate: initialDate ?? this.initialDate,
      finalDate: finalDate != null ? finalDate() : this.finalDate,
      workingDays: workingDays != null ? workingDays() : this.workingDays,
    );
  }

  @override
  List<Object?> get props => [
        status,
        failureMessage,
        days,
        initialDate,
        if (showFinalDate) finalDate,
        if (showWorkingDays) workingDays,
      ];
}
