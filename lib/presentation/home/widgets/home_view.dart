import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/home/bloc/home_bloc.dart';
import 'package:work_calendar/presentation/init/cubit/app_cubit.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';
import 'package:work_calendar/shared/extension/formatted_date_time.dart';
import 'package:work_calendar/shared/widgets/custom_text_from_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _initialDateController = TextEditingController();
  final _finalDateController = TextEditingController();

  @override
  void dispose() {
    _initialDateController.dispose();
    _finalDateController.dispose();
    super.dispose();
  }

  void _updateControllers(BuildContext context, HomeState state) {
    context.read<AppCubit>().setLoading(state.status == HomeStatus.loading);

    if (getFormattedDateTime(state.initialDate) !=
        _initialDateController.text) {
      _initialDateController.text = getFormattedDateTime(state.initialDate);
    }
    if (getFormattedDateTime(state.finalDate) != _finalDateController.text) {
      _finalDateController.text = getFormattedDateTime(state.finalDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: _updateControllers,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Working days calculator',
                  style: context.theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 60),
                CustomTextFormField(
                  title: 'Initial Date',
                  controller: _initialDateController,
                  suffixIcon: const Icon(Icons.calendar_month_rounded),
                  isButton: true,
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      firstDate: DateTime.utc(DateTime.now().year - 10),
                      lastDate: DateTime.utc(DateTime.now().year + 10),
                    ).then((date) {
                      if (date != null) {
                        context.read<HomeBloc>().add(InitialDatePicked(date));
                      }
                    });
                  },
                ),
                AnimatedOpacity(
                  opacity: state.showFinalDate ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      CustomTextFormField(
                        title: 'Final Date',
                        controller: _finalDateController,
                        suffixIcon: const Icon(Icons.calendar_month_rounded),
                        isButton: true,
                        onTap: () async {
                          await showDatePicker(
                            context: context,
                            firstDate: DateTime.utc(DateTime.now().year - 10),
                            lastDate: DateTime.utc(DateTime.now().year + 10),
                          ).then((date) {
                            if (date != null) {
                              context.read<HomeBloc>().add(FinalDatePicked(date));
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: state.showWorkingDays ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'Working days calculated: ${state.workingDays}',
                        style: context.theme.textTheme.headlineSmall,
                      )
                    ],
                  ),
                )
                // const Calendar(),
              ],
            ),
          );
        },
      ),
    );
  }
}
