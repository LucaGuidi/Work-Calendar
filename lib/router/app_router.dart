import 'package:auto_route/auto_route.dart';
import 'package:work_calendar/presentation/home/home_page.dart';
import 'package:work_calendar/presentation/settings/settings_page.dart';
import 'package:work_calendar/presentation/settings/widgets/days_select_page.dart';
import 'package:work_calendar/presentation/settings/widgets/holidays_select_dialog.dart';
import 'package:work_calendar/presentation/tab_bar/tab_bar_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TabBarRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page, path: '/home'),
        AutoRoute(page: SettingsRoute.page, path: '/settings'),
        AutoRoute(page: DaysSelectRoute.page, path: '/days_select'),
        AutoRoute(page: HolidaysSelectRoute.page, path: '/holidays_select'),
      ];
}
