import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:work_calendar/core/errors/models/failure.dart';
import 'package:work_calendar/data/models/day.dart';
import 'package:work_calendar/data/repository/days_repository.dart';

@LazySingleton(as: DaysRepository)
class DaysRepositoryImpl extends DaysRepository {
  @override
  Future<Either<Failure, List<Day>>> getDays() {
    return catchException(() async {
      final response = await dataSource.getDays();
      return response;
    });
  }
}
