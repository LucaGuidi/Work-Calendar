import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/home/bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APP BAR"),
      ),
      backgroundColor: Colors.blue.withAlpha(50),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
