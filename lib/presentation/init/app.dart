import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/core/models/environment.dart';
import 'package:work_calendar/presentation/init/cubit/app_cubit.dart';
import 'package:work_calendar/router/app_router.dart';
import 'package:work_calendar/shared/widgets/app_loader.dart';
import 'package:work_calendar/theme/theme.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final env = Environment.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        )
      ],
      child: MaterialApp.router(
        title: env?.appName ?? '',
        theme: AppTheme().toThemeData(),
        debugShowCheckedModeBanner: env?.env == Environments.dev,
        routerConfig: _appRouter.config(),
        builder: (context, child) {
          return AppLoader(
            child: child!,
          );
        },
      ),
    );
  }
}
