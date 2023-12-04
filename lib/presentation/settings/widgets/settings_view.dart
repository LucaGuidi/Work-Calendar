import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_calendar/presentation/settings/widgets/days_select_page.dart';
import 'package:work_calendar/presentation/settings/widgets/holidays_select_dialog.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor:  CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            stretch: true,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            largeTitle: const Text('SETTINGS').tr(),
            previousPageTitle: 'WORKING_DAYS'.tr(),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoListTile(
                      title: const Text("NON_WORKING_DAYS").tr(),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (_) => const DaysSelectPage(),
                        ),
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoListTile(
                      title: const Text("HOLIDAYS").tr(),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (_) => const HolidaysSelectPage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}