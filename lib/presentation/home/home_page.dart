import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/data/repository/days_repository.dart';
import 'package:work_calendar/presentation/home/bloc/home_bloc.dart';
import 'package:work_calendar/presentation/home/widgets/home_view.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutoRouteAwareStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didPushNext() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(getIt<DaysRepository>()),
      child: HomeView(
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
