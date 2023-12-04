import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_calendar/core/models/environment.dart' as app;

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    this.title,
    required this.description,
    required this.buttonText,
    this.onConfirm,
  });

  final String? title;
  final String description;
  final String buttonText;
  final Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title?.tr() ?? app.Environment.of(context)!.appName!,
        textAlign: TextAlign.center,
      ),
      content: Text(
        description,
        textAlign: TextAlign.center,
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: onConfirm ?? () => context.popRoute(),
          child: Text(buttonText.toUpperCase()),
        ),
      ],
    );
  }
}
