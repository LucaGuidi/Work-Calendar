import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_calendar/presentation/home/widgets/menu.dart';
import 'package:work_calendar/presentation/settings/settings_page.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';

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
              child: const Text("MENU").tr(),
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (_) => const Menu(),
                ),
              ),
            ),
            largeTitle: const Text('CALENDAR').tr(),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text("SETTINGS").tr(),
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (_) => const SettingsPage(),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container() //ADD Calendar
            ),
          ),
        ],
      ),
    );
  }
}
