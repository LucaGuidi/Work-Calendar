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
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              // visible: state.isLoading,
              child: state.isLoading
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: context.theme.scaffoldBackgroundColor.withOpacity(0.4),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : null,
            );
          },
        ),
      ],
    );
  }
}
