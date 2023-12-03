import 'package:flutter/material.dart';

class AppTheme {
  final Color scaffoldBackgroundColor;
  final Color primaryColor;
  final Color secondaryColor;
  final Color surface;

  AppTheme(
      {this.scaffoldBackgroundColor = const Color(0xFF1A1A1A),
      this.primaryColor = const Color(0xFF1E90FF),
      this.secondaryColor = Colors.white,
      this.surface = const Color(0xFF333333)});

  ThemeData toThemeData() {
    var colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surface,
      onSurface: secondaryColor,
    );
    return ThemeData(
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      dialogBackgroundColor: surface,
      colorScheme: colorScheme,
      fontFamily: 'Consolas',
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: scaffoldBackgroundColor,
        centerTitle: true,
        iconTheme: const IconThemeData(size: 20),
        titleTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateColor.resolveWith((states) {
            var color = secondaryColor;
            if (states.contains(MaterialState.disabled)) {
              color = color.withOpacity(0.5);
            }
            return color;
          }),
          backgroundColor: MaterialStateColor.resolveWith((states) {
            var color = primaryColor;
            if (states.contains(MaterialState.disabled)) {
              color = color.withOpacity(0.5);
            }
            return color;
          }),
          textStyle: MaterialStateTextStyle.resolveWith((states) {
            return const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            );
          }),
        ),
      ),
      iconTheme: IconThemeData(
        color: secondaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: secondaryColor,
        suffixIconColor: secondaryColor,
        iconColor: secondaryColor,
        isDense: true,
        filled: true,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: secondaryColor),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: surface,
        dividerColor: primaryColor,
        headerForegroundColor: Colors.white,
      ),
    );
  }
}
