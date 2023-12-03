import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:work_calendar/shared/widgets/error_dialog.dart';
import 'package:work_calendar/shared/widgets/generic_dialog.dart';

enum DialogType { alert, info, error }

class DialogService {
  static Future<T?> show<T>(
    BuildContext context,
    DialogType dialogType, {
    String? title,
    String message = '',
    String? confirmButtonText,
    String? cancelButtonText,
    Function()? onConfirmButtonPressed,
    Function()? onCancelButtonPressed,
    bool barrierDismissable = true,
  }) async {
    confirmButtonText ??= 'OK'.tr();
    cancelButtonText ??= 'CANCEL'.tr();
    switch (dialogType) {
      case DialogType.alert:
        return showDialog<T?>(
          context: context,
          builder: (context) {
            return GenericDialog(
              title: title,
              confirmCaption: confirmButtonText,
              cancelCaption: cancelButtonText,
              message: message,
              onConfirm: onConfirmButtonPressed,
            );
          },
          barrierDismissible: barrierDismissable,
        );
      case DialogType.info:
        return showDialog<T?>(
          context: context,
          builder: (context) {
            return GenericDialog(
              title: title,
              confirmCaption: confirmButtonText,
              cancelCaption: cancelButtonText,
              message: message,
              onConfirm: onConfirmButtonPressed,
              onCancel: onCancelButtonPressed,
            );
          },
          barrierDismissible: barrierDismissable,
        );
      case DialogType.error:
        return showDialog<T?>(
          context: context,
          builder: (context) {
            return ErrorDialog(
              title: title,
              description: message,
              buttonText: confirmButtonText!,
              onConfirm: onConfirmButtonPressed,
            );
          },
          barrierDismissible: barrierDismissable,
        );
    }
  }
}
