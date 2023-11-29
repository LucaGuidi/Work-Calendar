import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';
import 'package:work_calendar/shared/functions/get_day_from_array.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                final days = getDaysFromArray(state.chosenDays, context.locale);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'NON_WORKING_DAYS'.tr(),
                      style: context.theme.textTheme.titleLarge,
                    ),
                    Divider(color: context.theme.colorScheme.primary),
                    for (var day in days)
                      Text(
                        day,
                        style: context.theme.textTheme.bodyMedium,
                      ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
