import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
import 'package:work_calendar/router/app_router.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';
import 'package:work_calendar/shared/functions/get_day_from_array.dart';
import 'package:work_calendar/shared/widgets/app_back_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('SETTINGS').tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CupertinoButton(
                  padding: const EdgeInsets.only(right: 10),
                  onPressed: () => context.pushRoute(const DaysSelectRoute()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "NON_WORKING_DAYS",
                        style: context.theme.textTheme.titleSmall,
                      ).tr(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: 
                CupertinoButton(
                  padding: const EdgeInsets.only(right: 10),
                  onPressed: () => context.pushRoute(const HolidaysSelectRoute()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "HOLIDAYS",
                        style: context.theme.textTheme.titleSmall,
                      ).tr(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return TableCalendar(
                      firstDay: DateTime.utc(2023),
                      lastDay: DateTime.utc(2025, 12, 31),
                      focusedDay: DateTime.now(),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      weekendDays: [...getWeekendDays(state.chosenDays)],
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekHeight: 40.0,
                      rowHeight: 60.0,
                      holidayPredicate: (day) => _holidayPredicate(day, state),
                      calendarBuilders: const CalendarBuilders(
                        holidayBuilder: _holidayBuilder,
                        todayBuilder: _todayBuilder,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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

Widget _holidayBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
  return SizedBox(
    height: 60.0,
    child: Center(
      child: Text(
        '${day.day}',
        style: const TextStyle(color: Colors.red),
      ),
    ),
  );
}

Widget _todayBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
  return AnimatedContainer(
    margin: const EdgeInsets.all(6.0),
    padding: const EdgeInsets.all(0),
    duration: const Duration(milliseconds: 250),
    decoration: BoxDecoration(
      color: context.theme.colorScheme.primary,
      shape: BoxShape.circle,
    ),
    height: 60.0,
    child: Center(
      child: Text('${day.day}'),
    ),
  );
}
