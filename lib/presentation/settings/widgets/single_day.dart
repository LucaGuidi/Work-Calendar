import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/settings/bloc/settings_bloc.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';

class SingleDay extends StatelessWidget {
  const SingleDay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Column(
          children: [
            _datePickerCard(
              context: context,
              title: "DATE",
              stateDate: state.userHolidays.isNotEmpty ? state.userHolidays.last : null,
              onDatePicked: (date) {},
            ),
            const SizedBox(height: 30),
            _datePickerCard(
              context: context,
              title: "DATE",
              stateDate: state.userHolidays.isNotEmpty ? state.userHolidays.last : null,
              onDatePicked: (date) {},
            ),
          ],
        );
      },
    );
  }
}

Widget _datePickerCard({
  required BuildContext context,
  required void Function(DateTime) onDatePicked,
  required String title,
  DateTime? stateDate,
}) {
  return GestureDetector(
    onTap: () async {
      await showDatePicker(
        context: context,
        firstDate: DateTime.utc(DateTime.now().year - 10),
        lastDate: DateTime.utc(DateTime.now().year + 10),
      ).then((date) {
        if (date != null) {
          onDatePicked(date);
        }
      });
    },
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                title,
                style: context.theme.textTheme.titleSmall,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              stateDate != null ? DateFormat('d MMMM yyyy').format(stateDate) : '',
              textAlign: TextAlign.center,
              style: context.theme.textTheme.headlineSmall,
            ),
          )
        ],
      ),
    ),
  );
}
