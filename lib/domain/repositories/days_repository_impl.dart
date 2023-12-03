import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:work_calendar/core/errors/models/failure.dart';
import 'package:work_calendar/data/models/day.dart';
import 'package:work_calendar/data/models/working_days_request.dart';
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

  @override
  Future<Either<Failure, Day>> getDayByDate(String date) {
    return catchException(() async {
      final response = await dataSource.getDayByDate(date);
      return response;
    });
  }

  @override
  Future<Either<Failure, int>> getWorkingDays({
    required int initialDate,
    required int finalDate,
    required List<String> nonWorkingDays,
  }) {
    return catchException(() async {
      final response = await dataSource.getWorkingDaysNumber(
        WorkingDaysRequest(
          initialDate: initialDate,
          finalDate: finalDate,
          nonWorkingDays: nonWorkingDays,
        ),
      );
      return response;
    });
  }

  @override
  Future<Either<Failure, List<Day>>> getHolidays() {
    return catchException(() async {
      final response = await dataSource.getHolidays();
      return response;
    });
  }
}
