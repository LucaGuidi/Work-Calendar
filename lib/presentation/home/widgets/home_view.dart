import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:work_calendar/presentation/home/bloc/home_bloc.dart';
import 'package:work_calendar/presentation/init/cubit/app_cubit.dart';
import 'package:work_calendar/router/app_router.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset('assets/images/menu.svg'),
        ),
        actions: [
          IconButton(
            onPressed: () => context.pushRoute(const SettingsRoute()),
            icon: SvgPicture.asset("assets/images/settings.svg"),
          )
        ],
        title: const Text('WORKING_DAYS_CALCULATOR').tr(),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          context.read<AppCubit>().setLoading(state.status == HomeStatus.loading);
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
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
                  AnimatedOpacity(
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
                  AnimatedOpacity(
                    opacity: state.showWorkingDays ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        const SizedBox(height: 60),
                        Text(
                          'WORKING_DAYS_CALCULATED',
                          textAlign: TextAlign.center,
                          style: context.theme.textTheme.headlineSmall,
                        ).tr(),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '${state.workingDays ?? '  '}',
                            style: context.theme.textTheme.headlineLarge,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
      height: context.height / 5,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
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
          if (stateDate != null) ...[
            const SizedBox(height: 20),
            Center(
              child: Text(
                DateFormat('d MMMM yyyy').format(stateDate),
                style: context.theme.textTheme.headlineSmall,
              ),
            )
          ]
        ],
      ),
    ),
  );
}
