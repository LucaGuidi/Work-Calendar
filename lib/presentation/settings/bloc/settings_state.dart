part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.chosenDays = const [false, false, false, false, false, true, true],
    this.holidays = const [],
    this.isSingleDay = false,
    this.userHolidays = const [],
  });

  final List<bool> chosenDays;
  final List<DateTime> holidays;
  final bool isSingleDay;
  final List<DateTime> userHolidays;

  SettingsState copyWith({
    List<bool>? chosenDays,
    List<DateTime>? holidays,
    bool? isSingleDay,
    List<DateTime>? userHolidays,
  }) {
    return SettingsState(
      chosenDays: chosenDays ?? this.chosenDays,
      holidays: holidays ?? this.holidays,
      isSingleDay: isSingleDay ?? this.isSingleDay,
      userHolidays: userHolidays ?? this.userHolidays,
    );
  }

  @override
  List<Object> get props => [
        chosenDays,
        holidays,
        isSingleDay,
        userHolidays,
      ];
}
