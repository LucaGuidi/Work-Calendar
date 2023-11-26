import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_calendar/presentation/init/cubit/app_cubit.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Visibility(
              visible: state.isLoading,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: context.theme.colorScheme.primary.withOpacity(0.2),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
