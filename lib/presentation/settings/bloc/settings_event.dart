part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {}

class SettingsStarted extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

class SettingsDaysChanged extends SettingsEvent {
  SettingsDaysChanged({
    required this.dayIndex,
    required this.dayValue,
  });

  final int dayIndex;
  final bool dayValue;

  @override
  List<Object?> get props => [
        dayIndex,
        dayValue,
      ];
}

class HolidaysSelectorToggled extends SettingsEvent {
  HolidaysSelectorToggled(this.value);

  final bool value;

  @override
  List<Object?> get props => [value];
}

class HolidaysFromChanged extends SettingsEvent {
  HolidaysFromChanged(this.fromDate);

  final DateTime? Function()? fromDate;

  @override
  List<Object?> get props => [fromDate];
}

class HolidaysToChanged extends SettingsEvent {
  HolidaysToChanged(this.toDate);

  final DateTime? Function()? toDate;

  @override
  List<Object?> get props => [toDate];
}

class HolidaysPagePopped extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

class HolidaysAdded extends SettingsEvent {
  @override
  List<Object?> get props => [];
}
