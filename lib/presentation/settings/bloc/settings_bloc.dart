import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/data/repository/days_repository.dart';
import 'package:work_calendar/domain/repositories/storage_service.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsStarted>(_onStarted);
    on<SettingsDaysChanged>(_onSettingsDaysChanged);
    on<HolidaysSelectorToggled>(_onHolidaysSelectorToggled);
  }

  FutureOr<void> _onStarted(SettingsStarted event, Emitter<SettingsState> emit) async {
    List<bool> nonWorkingDays = getIt<StorageService>().loadNonWorkingDays();
    final failureOrHolidays = await getIt<DaysRepository>().getHolidays();

    failureOrHolidays.fold(
      (failure) {
        //TODO
      },
      (days) {
        List<DateTime> d = [];
        for (var day in days) {
          d.add(DateTime.fromMillisecondsSinceEpoch(day.date ?? 0));
        }
        if (nonWorkingDays.isNotEmpty) {
          emit(state.copyWith(chosenDays: [...nonWorkingDays], holidays: [...d]));
        } else {
          emit(state.copyWith(holidays: [...d]));
        }
      },
    );
  }

  FutureOr<void> _onSettingsDaysChanged(SettingsDaysChanged event, Emitter<SettingsState> emit) async {
    List<bool> updatedDays = [...state.chosenDays];
    updatedDays[event.dayIndex] = event.dayValue;

    await getIt<StorageService>().storeNonWorkingDays(updatedDays);

    emit(state.copyWith(chosenDays: updatedDays));
  }

  FutureOr<void> _onHolidaysSelectorToggled(HolidaysSelectorToggled event, Emitter<SettingsState> emit) {
    emit(state.copyWith(isSingleDay: event.value));
  }
}
