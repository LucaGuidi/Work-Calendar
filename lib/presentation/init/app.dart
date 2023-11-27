import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/core/models/environment.dart';
import 'package:work_calendar/presentation/init/cubit/app_cubit.dart';
import 'package:work_calendar/router/app_router.dart';
import 'package:work_calendar/shared/widgets/app_loader.dart';
import 'package:work_calendar/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final env = Environment.of(context);
    return EasyLocalization(
      path: env?.locale?.path ?? '',
      supportedLocales: env?.locale?.supported ?? [],
      fallbackLocale: env?.locale?.fallback,
      assetLoader: env?.locale?.loader,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit(),
          )
        ],
        child: _LocalizedApplication(),
      ),
    );
  }
}

class _LocalizedApplication extends StatefulWidget {
  @override
  State<_LocalizedApplication> createState() => _LocalizedApplicationState();
}

class _LocalizedApplicationState extends State<_LocalizedApplication> {
  @override
  void initState() {
    _registerAppRouter();
    super.initState();
  }

  void _registerAppRouter() {
    if (!getIt.isRegistered<AppRouter>()) {
      getIt.registerSingleton<AppRouter>(AppRouter());
    }
  }

  @override
  Widget build(BuildContext context) {
    final env = Environment.of(context);
    final appRouter = getIt<AppRouter>();
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: env?.appName ?? '',
      theme: AppTheme().toThemeData(),
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: env?.env == Environments.dev,
      builder: (context, child) {
        return AppLoader(
          child: child!,
        );
      },
    );
  }
}
