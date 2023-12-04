import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';
import 'package:work_calendar/shared/functions/get_day_from_array.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            stretch: true,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            largeTitle: const Text("MENU").tr(),
            previousPageTitle: 'WORKING_DAYS'.tr(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                final days = getDaysFromArray(state.chosenDays, context.locale);
                return Column(
                  children: [
                    CupertinoListSection.insetGrouped(
                      header: const Text("NON_WORKING_DAYS").tr(),
                      children: [
                        for (var day in days) CupertinoListTile(title: Text(day)),
                      ],
                    ),
                    if (state.userHolidays.isNotEmpty)
                      CupertinoListSection.insetGrouped(
                        header: const Text("HOLIDAYS").tr(),
                        children: [
                          for (var day in state.userHolidays)
                            CupertinoListTile(
                              title: Text(DateFormat('dd MMM yyyy').format(day)),
                            ),
                        ],
                      ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
