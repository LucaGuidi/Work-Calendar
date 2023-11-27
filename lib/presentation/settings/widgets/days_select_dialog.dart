import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';

class DaysSelectDialog extends StatelessWidget {
  const DaysSelectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: context.width / 1.2,
            decoration: BoxDecoration(
              color: context.theme.dialogBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: context.theme.scaffoldBackgroundColor.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
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
