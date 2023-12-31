import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/core/models/environment.dart';
import 'package:work_calendar/presentation/init/cubit/app_cubit.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
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
          ),
          BlocProvider(
            create: (context) => SettingsBloc()..add(SettingsStarted()),
          ),
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
    FlutterNativeSplash.remove();

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
    return CupertinoApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: env?.appName ?? '',
      theme: AppTheme().toThemeData(context),
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
