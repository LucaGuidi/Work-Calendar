// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;
import 'package:work_calendar/core/api/services/api_service.dart' as _i3;
import 'package:work_calendar/core/i18n/data_source/translations_data_source.dart'
    as _i9;
import 'package:work_calendar/core/i18n/repositories/translations_repository.dart'
    as _i10;
import 'package:work_calendar/core/injection/injection.dart' as _i11;
import 'package:work_calendar/data/data_sources/days_data_source.dart' as _i4;
import 'package:work_calendar/data/repository/days_repository.dart' as _i5;
import 'package:work_calendar/domain/repositories/days_repository_impl.dart'
    as _i6;
import 'package:work_calendar/domain/repositories/storage_service.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.ApiService>(() => _i3.ApiService());
    gh.lazySingleton<_i4.DaysDataSource>(() => _i4.DaysDataSourceImpl());
    gh.lazySingleton<_i5.DaysRepository>(() => _i6.DaysRepositoryImpl());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i8.StorageService>(
        () => _i8.StorageService(gh<_i7.SharedPreferences>()));
    gh.lazySingleton<_i9.TranslationDataSource>(
      () => _i9.TranslationDataSourceImpl(),
      instanceName: 'local',
    );
    gh.lazySingleton<_i10.TranslationRepository>(
        () => _i10.TranslationRepositoryImpl());
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
