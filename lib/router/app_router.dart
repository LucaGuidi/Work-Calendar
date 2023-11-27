import 'package:auto_route/auto_route.dart';
import 'package:work_calendar/presentation/home/home_page.dart';
import 'package:work_calendar/presentation/settings/settings_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SettingsRoute.page, path: '/settings'),
      ];
}
