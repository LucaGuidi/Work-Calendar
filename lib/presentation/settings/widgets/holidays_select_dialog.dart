import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';

@RoutePage()
class HolidaysSelectPage extends StatelessWidget {
  const HolidaysSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => context.read<SettingsBloc>().add(HolidaysPagePopped()),
      child: CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              stretch: true,
              backgroundColor: context.theme.scaffoldBackgroundColor,
              largeTitle: const Text('HOLIDAYS').tr(),
              previousPageTitle: 'SETTINGS'.tr(),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Text('ADD').tr(),
                onPressed: () {
                  context.read<SettingsBloc>().add(HolidaysAdded());
                  context.popRoute();
                },
              ),
            ),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return SliverFillRemaining(
                  child: CupertinoListSection.insetGrouped(
                    footer: const Text(
                      'HOLIDAYS_TEXT',
                      style: TextStyle(color: CupertinoColors.systemGrey),
                    ).tr(),
                    children: [
                      CupertinoListTile(
                        title: const Text("SINGLE_DAY").tr(),
                        trailing: CupertinoSwitch(
                          value: state.isSingleDay,
                          onChanged: (value) => context.read<SettingsBloc>().add(HolidaysSelectorToggled(value)),
                        ),
                      ),
                      if (!state.isSingleDay) ...[
                        CupertinoListTile(
                          title: const Text('From'),
                          trailing: CupertinoButton(
                            child: state.fromDay != null
                                ? Text(DateFormat('dd MMM yyyy').format(state.fromDay!))
                                : Text(DateFormat('dd MMM yyyy').format(DateTime.now())),
                            onPressed: () => _showDialog(
                              context,
                              CupertinoDatePicker(
                                initialDateTime: DateTime.now(),
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (newDate) {
                                  context.read<SettingsBloc>().add(HolidaysFromChanged(() => newDate));
                                },
                              ),
                            ),
                          ),
                        ),
                        CupertinoListTile(
                          title: const Text('To'),
                          trailing: CupertinoButton(
                            child: state.toDay != null
                                ? Text(DateFormat('dd MMM yyyy').format(state.toDay!))
                                : Text(DateFormat('dd MMM yyyy').format(DateTime.now())),
                            onPressed: () => _showDialog(
                              context,
                              CupertinoDatePicker(
                                initialDateTime: DateTime.now(),
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (newDate) {
                                  context.read<SettingsBloc>().add(HolidaysToChanged(() => newDate));
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                      if (state.isSingleDay)
                        CupertinoListTile(
                          title: const Text('Day'),
                          trailing: CupertinoButton(
                            child: state.fromDay != null
                                ? Text(DateFormat('dd MMM yyyy').format(state.fromDay!))
                                : Text(DateFormat('dd MMM yyyy').format(DateTime.now())),
                            onPressed: () => _showDialog(
                              context,
                              CupertinoDatePicker(
                                initialDateTime: DateTime.now(),
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (newDate) {
                                  context.read<SettingsBloc>().add(HolidaysFromChanged(() => newDate));
                                },
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, Widget child) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}
