import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';

@RoutePage()
class DaysSelectPage extends StatelessWidget {
  const DaysSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                stretch: true,
                backgroundColor: context.theme.scaffoldBackgroundColor,
                largeTitle: const Text('NON_WORKING_DAYS').tr(),
                previousPageTitle: 'SETTINGS'.tr(),
              ),
              SliverFillRemaining(
                child: CupertinoListSection.insetGrouped(
                  footer: const Text(
                    'NON_WORKING_DAYS_TEXT',
                    style: TextStyle(color: CupertinoColors.systemGrey),
                  ).tr(),
                  children: [
                    CupertinoListTile(
                      title: const Text("MONDAY").tr(),
                      trailing: CupertinoSwitch(
                        value: state.chosenDays[0],
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 0, dayValue: value));
                        },
                      ),
                    ),
                    CupertinoListTile(
                      title: const Text("TUESDAY").tr(),
                      trailing: CupertinoSwitch(
                        value: state.chosenDays[1],
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 1, dayValue: value));
                        },
                      ),
                    ),
                    CupertinoListTile(
                      title: const Text("WEDNESDAY").tr(),
                      trailing: CupertinoSwitch(
                        value: state.chosenDays[2],
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 2, dayValue: value));
                        },
                      ),
                    ),
                    CupertinoListTile(
                      title: const Text("THURSDAY").tr(),
                      trailing: CupertinoSwitch(
                        value: state.chosenDays[3],
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 3, dayValue: value));
                        },
                      ),
                    ),
                    CupertinoListTile(
                      title: const Text("FRIDAY").tr(),
                      trailing: CupertinoSwitch(
                        value: state.chosenDays[4],
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 4, dayValue: value));
                        },
                      ),
                    ),
                    CupertinoListTile(
                      title: const Text("SATURDAY").tr(),
                      trailing: CupertinoSwitch(
                        value: state.chosenDays[5],
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 5, dayValue: value));
                        },
                      ),
                    ),
                    CupertinoListTile(
                      title: const Text("SUNDAY").tr(),
                      trailing: CupertinoSwitch(
                        value: state.chosenDays[6],
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 6, dayValue: value));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
