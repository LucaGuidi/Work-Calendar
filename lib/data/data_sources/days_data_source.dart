import 'package:injectable/injectable.dart';
import 'package:work_calendar/core/api/models/api_options.dart';
import 'package:work_calendar/core/api/services/api_service.dart';
import 'package:work_calendar/core/data/data_source.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/data/models/day.dart';
import 'package:work_calendar/data/models/working_days_request.dart';

abstract class DaysDataSource implements DataSource {
  Future<List<Day>> getDays();
  Future<Day> getDayByDate(String date);
  Future<int> getWorkingDaysNumber(WorkingDaysRequest request);
  Future<List<Day>> getHolidays();
}

@LazySingleton(as: DaysDataSource)
class DaysDataSourceImpl extends DaysDataSource {
  @override
  Future<List<Day>> getDays() async {
    final response = await getIt<ApiService>().callApi(
      'getDays',
      options: const ApiOptions(),
    );

    return List<Day>.from((response.data as Iterable).map(
      (e) => Day.fromJson(e),
    ));
  }

  @override
  Future<Day> getDayByDate(String date) async {
    final response = await getIt<ApiService>().callApi(
      'getDayByDate',
      options: ApiOptions(rest: {
        'date': date,
      }),
    );

    return Day.fromJson(response.data);
  }

  @override
  Future<int> getWorkingDaysNumber(WorkingDaysRequest request) async {
    final response = await getIt<ApiService>().callApi(
      'getWorkingDays',
      options: ApiOptions(body: request.toJson()),
    );

    return response.data['workingDays'];
  }

  @override
  Future<List<Day>> getHolidays() async {
    final response = await getIt<ApiService>().callApi(
      'getHolidays',
      options: const ApiOptions(),
    );

    return List<Day>.from((response.data as Iterable).map(
      (e) => Day.fromJson(e),
    ));
  }
}
