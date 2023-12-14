import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/home/bloc/home_bloc.dart';
import 'package:work_calendar/presentation/home/widgets/menu.dart';
import 'package:work_calendar/presentation/init/cubit/app_cubit.dart';
import 'package:work_calendar/presentation/settings/settings_page.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';
import 'package:work_calendar/shared/widgets/dialogs_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            stretch: true,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text("MENU").tr(),
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (_) => const Menu(),
                ),
              ),
            ),
            largeTitle: const Text('WORKING_DAYS').tr(),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text("SETTINGS").tr(),
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (_) => const SettingsPage(),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                context.read<AppCubit>().setLoading(state.status == HomeStatus.loading);
                if (state.status == HomeStatus.failure) {
                  DialogService.show(
                    context,
                    DialogType.error,
                    message: state.failureMessage,
                  );
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      _datePickerCard(
                        context: context,
                        onDatePicked: (date) {
                          context.read<HomeBloc>().add(InitialDatePicked(date));
                        },
                        title: "INITIAL_DATE".tr(),
                        stateDate: state.initialDate,
                      ),
                      const SizedBox(height: 60),
                      Visibility(
                        visible: state.showFinalDate,
                        child: AnimatedOpacity(
                          opacity: state.showFinalDate ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: _datePickerCard(
                            context: context,
                            onDatePicked: (date) {
                              context.read<HomeBloc>().add(FinalDatePicked(() => date));
                            },
                            title: "FINAL_DATE".tr(),
                            stateDate: state.finalDate,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: state.showWorkingDays ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: Column(
                          children: [
                            const SizedBox(height: 60),
                            Text(
                              'WORKING_DAYS_CALCULATED',
                              textAlign: TextAlign.center,
                              style: context.theme.textTheme.dateTimePickerTextStyle,
                            ).tr(),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                color: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? context.theme.barBackgroundColor
                                    : context.theme.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${state.workingDays ?? '  '}',
                                style: context.theme.textTheme.dateTimePickerTextStyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
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
      DateTime? date;
      await showCupertinoModalPopup<DateTime>(
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
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (newDate) {
                date = newDate;
              },
            ),
          ),
        ),
      ).then((value) {
        if (date != null) {
          onDatePicked(date!);
        }
      });
    },
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? context.theme.barBackgroundColor
            : context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(title),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              stateDate != null ? DateFormat('d MMMM yyyy').format(stateDate) : '',
              textAlign: TextAlign.center,
              style: context.theme.textTheme.dateTimePickerTextStyle,
            ),
          )
        ],
      ),
    ),
  );
}
