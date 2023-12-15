import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:work_calendar/presentation/home/widgets/menu.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
import 'package:work_calendar/presentation/settings/settings_page.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';
import 'package:work_calendar/shared/functions/get_day_from_array.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            stretch: true,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text('MENU').tr(),
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (_) => const Menu(),
                ),
              ),
            ),
            largeTitle: const Text('CALENDAR').tr(),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text('SETTINGS').tr(),
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (_) => const SettingsPage(),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                const SizedBox(height: 40),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return Material(
                      color: context.theme.scaffoldBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.barBackgroundColor,
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: TableCalendar(
                            firstDay: DateTime.utc(DateTime.now().year - 10),
                            focusedDay: DateTime.now(),
                            lastDay: DateTime.utc(DateTime.now().year + 10),
                            headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                              titleTextStyle: context.theme.textTheme.dateTimePickerTextStyle,
                            ),
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            calendarStyle: CalendarStyle(
                              defaultTextStyle: context.theme.textTheme.textStyle.copyWith(fontSize: 16),
                              outsideTextStyle: context.theme.textTheme.textStyle.copyWith(color: CupertinoColors.systemGrey, fontSize: 16),
                              weekendTextStyle: context.theme.textTheme.textStyle.copyWith(color: CupertinoColors.systemGrey, fontSize: 16),
                              todayDecoration: BoxDecoration(color: context.theme.primaryColor, shape: BoxShape.circle),
                            ),
                            weekendDays: [...getWeekendDays(state.chosenDays)],
                            holidayPredicate: (day) => _holidayPredicate(day, state),
                            selectedDayPredicate: (day) => _selectedPredicate(day, state),
                            calendarBuilders: CalendarBuilders(
                              holidayBuilder: (context, day, focusedDay) {
                                return SizedBox(
                                  height: 60.0,
                                  child: Center(
                                    child: Text(
                                      '${day.day}',
                                      style: context.theme.textTheme.textStyle.copyWith(color: Colors.red, fontSize: 16),
                                    ),
                                  ),
                                );
                              },
                              selectedBuilder: (context, day, focusedDay) {
                                return SizedBox(
                                  height: 60.0,
                                  child: Center(
                                    child: Text(
                                      '${day.day}',
                                      style: context.theme.textTheme.textStyle.copyWith(color: CupertinoColors.activeOrange, fontSize: 16),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<int> getWeekendDays(List<bool> days) {
  List<int> weekdays = [];
  var daysList = getDaysFromArray(days);

  for (var element in daysList) {
    if (element == 'Monday') {
      weekdays.add(DateTime.monday);
    }
    if (element == 'Tuesday') {
      weekdays.add(DateTime.tuesday);
    }
    if (element == 'Wednesday') {
      weekdays.add(DateTime.wednesday);
    }
    if (element == 'Thursday') {
      weekdays.add(DateTime.thursday);
    }
    if (element == 'Friday') {
      weekdays.add(DateTime.friday);
    }
    if (element == 'Saturday') {
      weekdays.add(DateTime.saturday);
    }
    if (element == 'Sunday') {
      weekdays.add(DateTime.sunday);
    }
  }

  return weekdays;
}

bool _holidayPredicate(DateTime day, SettingsState state) {
  for (var element in state.holidays) {
    if (element.day == day.day && element.month == day.month && element.year == day.year) {
      return true;
    }
  }
  return false;
}

bool _selectedPredicate(DateTime day, SettingsState state) {
  for (var element in state.userHolidays) {
    if (element.day == day.day && element.month == day.month && element.year == day.year) {
      return true;
    }
  }
  return false;
}
