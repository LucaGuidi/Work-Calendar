import 'package:dartz/dartz.dart';
import 'package:work_calendar/core/data/repository.dart';
import 'package:work_calendar/core/errors/models/failure.dart';
import 'package:work_calendar/data/data_sources/days_data_source.dart';
import 'package:work_calendar/data/models/day.dart';

abstract class DaysRepository extends Repository<DaysDataSource> {
  Future<Either<Failure, List<Day>>> getDays();
}