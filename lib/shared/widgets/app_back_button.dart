import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => context.popRoute(),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}
