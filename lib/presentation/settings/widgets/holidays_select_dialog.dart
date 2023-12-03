import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';
import 'package:work_calendar/shared/widgets/app_back_button.dart';

@RoutePage()
class HolidaysSelectPage extends StatelessWidget {
  const HolidaysSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButton(),
            title: const Text('HOLIDAYS').tr(),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'HOLIDAYS_TEXT',
                      style: context.theme.textTheme.bodySmall!.copyWith(color: Colors.grey),
                    ).tr(),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Single day",
                              style: context.theme.textTheme.bodyMedium,
                            ),
                            CupertinoSwitch(
                              value: state.isSingleDay,
                              onChanged: (value) => context.read<SettingsBloc>().add(HolidaysSelectorToggled(value)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (!state.isSingleDay)
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          CupertinoButton(
                            padding: const EdgeInsets.only(right: 7),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "From",
                                  style: context.theme.textTheme.titleSmall,
                                ).tr(),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    '26 Nov 2023',
                                    style: context.theme.textTheme.titleSmall,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 0.1, height: 0),
                          CupertinoButton(
                            padding: const EdgeInsets.only(right: 7),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "to",
                                  style: context.theme.textTheme.titleSmall,
                                ).tr(),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    '26 Nov 2023',
                                    style: context.theme.textTheme.titleSmall,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (state.isSingleDay)
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CupertinoButton(
                        padding: const EdgeInsets.only(right: 7),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Day",
                              style: context.theme.textTheme.titleSmall,
                            ).tr(),
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '26 Nov 2023',
                                style: context.theme.textTheme.titleSmall,
                              ),
                            )
                          ],
                        ),
                      ),
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
