import 'package:flutter/material.dart';

class AppTheme {
  final Color scaffoldBackgroundColor;
  final Color primaryColor;
  final Color secondaryColor;

  AppTheme({
    this.scaffoldBackgroundColor = const Color(0xFFE2D4CA),
    this.primaryColor = const Color(0xFF212223),
    this.secondaryColor = const Color(0xFFC6924F),
  });

  ThemeData toThemeData() {
    var colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      onPrimary: secondaryColor,
      secondary: secondaryColor,
      onSecondary: primaryColor,
      surface: scaffoldBackgroundColor,
      onSurface: primaryColor,
    );
    return ThemeData(
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      dialogBackgroundColor: scaffoldBackgroundColor,
      colorScheme: colorScheme,
      fontFamily: 'Consolas',
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackgroundColor,
        centerTitle: true,
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
        )
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: secondaryColor,
      ),
    );
  }
}
