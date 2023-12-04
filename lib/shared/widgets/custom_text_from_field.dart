import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:work_calendar/shared/extension/build_context_extension.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.title,
    this.obscureText = false,
    this.inputFormatters,
    this.initialValue,
    this.focusNode,
    this.enabled = true,
    this.onTap,
    this.controller,
    this.onChanged,
    this.isButton = false,
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.textInputAction,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String? title;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final FocusNode? focusNode;
  final bool enabled;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool isButton;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              title!
            ),
          ),
        TextFormField(
          cursorColor: context.theme.primaryContrastingColor,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          initialValue: initialValue,
          focusNode: focusNode,
          readOnly: !enabled,
          onTap: enabled ? onTap : () {},
          style: TextStyle(fontSize: 16, color: context.theme.primaryContrastingColor),
          smartQuotesType: SmartQuotesType.disabled,
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          onChanged: onChanged,
          keyboardType: (isButton) ? TextInputType.none : keyboardType,
          showCursor: !isButton,
          maxLength: maxLength,
          maxLines: maxLines,
          textInputAction: textInputAction,
          validator: validator,
          decoration: InputDecoration(
            focusColor: context.theme.primaryContrastingColor,
            hoverColor: context.theme.primaryContrastingColor,
            iconColor: context.theme.primaryContrastingColor,
            isDense: true,
            filled: true,
            fillColor: context.theme.primaryColor,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabled: enabled,
          ),
        ),
      ],
    );
  }
}
