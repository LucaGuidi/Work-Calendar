import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/domain/repositories/storage_service.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsStarted>(_onStarted);
    on<SettingsDaysChanged>(_onSettingsDaysChanged);
  }

  FutureOr<void> _onStarted(SettingsStarted event, Emitter<SettingsState> emit) {
    List<bool> nonWorkingDays = getIt<StorageService>().loadNonWorkingDays();

    if (nonWorkingDays.isNotEmpty) {
      emit(state.copyWith(chosenDays: [...nonWorkingDays]));
    }
  }

  FutureOr<void> _onSettingsDaysChanged(SettingsDaysChanged event, Emitter<SettingsState> emit) async {
    List<bool> updatedDays = [...state.chosenDays];
    updatedDays[event.dayIndex] = event.dayValue;

    await getIt<StorageService>().storeNonWorkingDays(updatedDays);

    emit(state.copyWith(chosenDays: updatedDays));
  }
}