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
    on<HolidaysFromChanged>(_onHolidaysFromChanged);
    on<HolidaysToChanged>(_onHolidaysToChanged);
    on<HolidaysPagePopped>(_onPagePopped);
    on<HolidaysAdded>(_onHolidaysAdded);
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

  FutureOr<void> _onHolidaysFromChanged(HolidaysFromChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(fromDay: event.fromDate));
  }

  FutureOr<void> _onHolidaysToChanged(HolidaysToChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(toDay: event.toDate));
  }

  FutureOr<void> _onPagePopped(HolidaysPagePopped event, Emitter<SettingsState> emit) {
    emit(state.copyWith(toDay: () => null, fromDay: () => null));
  }

  FutureOr<void> _onHolidaysAdded(HolidaysAdded event, Emitter<SettingsState> emit) {
    if (state.isSingleDay) {
      if (state.fromDay != null) {
        if (!state.userHolidays.contains(state.fromDay)) {
          List<DateTime> userHolidays = [...state.userHolidays, state.fromDay!];
          userHolidays.sort((a, b) => a.compareTo(b));
          emit(state.copyWith(userHolidays: [...userHolidays]));
        }
      }
    } else {
      if (state.fromDay != null && state.toDay != null) {
        List<DateTime> days = getDaysInBetween(state.fromDay!, state.toDay!);
        for (var element in state.holidays) {
          for (var day in days) {
            if (element == day) {
              days.remove(day);
            }
          }
        }

        List<DateTime> userHolidays = [...state.userHolidays, ...days];
        userHolidays.sort((a, b) => a.compareTo(b));
        emit(state.copyWith(userHolidays: [...userHolidays]));
      }
    }
  }
}

List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}
