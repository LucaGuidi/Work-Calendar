import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';
import 'package:work_calendar/core/models/environment.dart' as app;

class GenericDialog extends StatelessWidget {
  const GenericDialog({
    super.key,
    this.title,
    required this.message,
    this.onConfirm,
    this.confirmCaption,
    this.onCancel,
    this.cancelCaption,
  });

  final String? title;
  final String message;
  final void Function()? onConfirm;
  final String? confirmCaption;
  final void Function()? onCancel;
  final String? cancelCaption;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: context.width / 1.2,
        decoration: BoxDecoration(
          color: context.theme.dialogBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: context.theme.scaffoldBackgroundColor.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              Text(
                title?.tr() ?? app.Environment.of(context)!.appName!,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 10),
              Text(
                message.tr(),
                textAlign: TextAlign.center,
                style: context.theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    if (onConfirm != null)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onConfirm,
                          child: FittedBox(
                            child: Text(
                              confirmCaption!.toUpperCase(),
                              style: context.theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 10),
                    if (onCancel != null)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onCancel,
                          child: FittedBox(
                            child: Text(
                              cancelCaption!.toUpperCase(),
                              style: context.theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
