import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_calendar/core/errors/models/failure.dart';
import 'package:work_calendar/data/models/day.dart';
import 'package:work_calendar/data/repository/days_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._daysRepository) : super(const HomeState()) {
    on<InitialDatePicked>(_onInitialDatePicked);
    on<FinalDatePicked>(_onFinalDatePicked);
  }

  final DaysRepository _daysRepository;

  FutureOr<void> _onInitialDatePicked(InitialDatePicked event, Emitter<HomeState> emit) async {
    emit(state.copyWith(initialDate: event.initialDate));
  }

  FutureOr<void> _onFinalDatePicked(FinalDatePicked event, Emitter<HomeState> emit) async {
    emit(state.copyWith(finalDate: event.finalDate, status: HomeStatus.loading));

    //DO THINGS
    final failureOrDay = await _daysRepository.getWorkingDays(
      initialDate: state.initialDate!.millisecondsSinceEpoch,
      finalDate: state.finalDate!.millisecondsSinceEpoch,
    );
    failureOrDay.fold(
      (failure) => null,
      (days) {
        emit(state.copyWith(
          status: HomeStatus.ready,
          workingDays: days,
        ));
      },
    );
  }
}
