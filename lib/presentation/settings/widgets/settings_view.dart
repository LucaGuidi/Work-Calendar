import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:work_calendar/presentation/settings/widgets/days_select_dialog.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SET_NON_WORKING_DAYS",
                      style: context.theme.textTheme.titleSmall,
                    ).tr(),
                    TextButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return const DaysSelectDialog();
                        },
                      ),
                      child: Text('SET'.tr().toUpperCase())
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
