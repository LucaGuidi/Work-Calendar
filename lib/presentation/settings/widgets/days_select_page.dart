import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';
import 'package:work_calendar/shared/widgets/app_back_button.dart';

@RoutePage()
class DaysSelectPage extends StatelessWidget {
  const DaysSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButton(),
            title: const Text('NON_WORKING_DAYS').tr(),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _switchRow(
                          context,
                          day: "MONDAY",
                          value: state.chosenDays[0],
                          onChanged: (value) {
                            context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 0, dayValue: value));
                          },
                        ),
                        _switchRow(
                          context,
                          day: "TUESDAY",
                          value: state.chosenDays[1],
                          onChanged: (value) {
                            context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 1, dayValue: value));
                          },
                        ),
                        _switchRow(
                          context,
                          day: "WEDNESDAY",
                          value: state.chosenDays[2],
                          onChanged: (value) {
                            context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 2, dayValue: value));
                          },
                        ),
                        _switchRow(
                          context,
                          day: "THURSDAY",
                          value: state.chosenDays[3],
                          onChanged: (value) {
                            context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 3, dayValue: value));
                          },
                        ),
                        _switchRow(
                          context,
                          day: "FRIDAY",
                          value: state.chosenDays[4],
                          onChanged: (value) {
                            context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 4, dayValue: value));
                          },
                        ),
                        _switchRow(
                          context,
                          day: "SATURDAY",
                          value: state.chosenDays[5],
                          onChanged: (value) {
                            context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 5, dayValue: value));
                          },
                        ),
                        _switchRow(
                          context,
                          day: "SUNDAY",
                          value: state.chosenDays[6],
                          onChanged: (value) {
                            context.read<SettingsBloc>().add(SettingsDaysChanged(dayIndex: 6, dayValue: value));
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'NON_WORKING_DAYS_TEXT',
                      style: context.theme.textTheme.bodySmall!.copyWith(color: Colors.grey),
                    ).tr(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _switchRow(
  BuildContext context, {
  required String day,
  required bool value,
  required void Function(bool)? onChanged,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        day.tr(),
        style: context.theme.textTheme.bodyMedium,
      ),
      CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      )
    ],
  );
}
