import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/data/repository/days_repository.dart';
import 'package:work_calendar/presentation/home/bloc/home_bloc.dart';
import 'package:work_calendar/presentation/home/widgets/home_view.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(getIt<DaysRepository>()),
      child: const HomeView(),
    );
  }
}
