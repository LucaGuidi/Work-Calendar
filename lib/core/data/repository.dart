import 'package:dartz/dartz.dart';
import 'package:work_calendar/core/api/services/logger_service.dart';
import 'package:work_calendar/core/data/data_source.dart';
import 'package:work_calendar/core/errors/models/failure.dart';
import 'package:work_calendar/core/injection/injection.dart';

typedef ErrorHandler = Failure? Function(dynamic error);

abstract class Repository<T extends DataSource> {
  T get dataSource => getIt<T>();

  Repository();

  Future<Either<Failure, R>> catchException<R>(
    Future<R> Function() call, {
    List<ErrorHandler> errorHandlers = const [],
  }) async {
    try {
      final result = await call();
      return Right(result);
    } catch (error, stackTrace) {
      LoggerService.e(error.toString(), error, stackTrace);
      if (error is Failure) return Left(error);
      Failure? failure;
      for (var handler in errorHandlers) {
        failure = handler(error);
        if (failure != null) return Left(failure);
      }
      return const Left(Failure.generic());
    }
  }
}
