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
