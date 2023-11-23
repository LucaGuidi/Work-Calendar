import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/data/models/day.dart';
import 'package:work_calendar/data/repository/days_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeStarted>(_onStarted);
  }

  FutureOr<void> _onStarted(event, Emitter<HomeState> emit) async {
    final failureOrDays = await getIt<DaysRepository>().getDays();

    failureOrDays.fold(
      (l) => null,
      (days) {
        emit(state.copyWith(days: days));
      },
    );
  }
}
