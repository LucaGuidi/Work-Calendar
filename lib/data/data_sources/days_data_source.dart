import 'package:injectable/injectable.dart';
import 'package:work_calendar/core/api/models/api_options.dart';
import 'package:work_calendar/core/api/services/api_service.dart';
import 'package:work_calendar/core/data/data_source.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/data/models/day.dart';

abstract class DaysDataSource implements DataSource {
  Future<List<Day>> getDays();
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
}
