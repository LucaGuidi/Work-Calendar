import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_calendar/presentation/calendar/calendar_page.dart';
import 'package:work_calendar/presentation/home/home_page.dart';

@RoutePage()
class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: 'Calendar',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomePage();
          case 1:
            return const CalendarPage();
        }
        return const HomePage();
      },
    );
  }
}
