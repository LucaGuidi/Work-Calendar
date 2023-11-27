part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.chosenDays = const [false, false, false, false, false, false, false],
  });

  final List<bool> chosenDays;

  SettingsState copyWith({
    List<bool>? chosenDays,
  }) {
    return SettingsState(
      chosenDays: chosenDays ?? this.chosenDays,
    );
  }

  @override
  List<Object> get props => [
        chosenDays,
      ];
}
