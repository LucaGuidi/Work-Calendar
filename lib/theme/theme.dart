import 'package:flutter/cupertino.dart';

class AppTheme {
  final Color scaffoldBackgroundColor;
  final Color primaryColor;
  final Color secondaryColor;
  final Color surface;

  AppTheme({
    this.scaffoldBackgroundColor = const Color(0xFF000000),
    this.primaryColor = const Color(0xFF2997FF),
    this.secondaryColor = const Color(0xFFF5F5F7),
    this.surface = const Color(0xFF1D1D1F),
  });

  CupertinoThemeData toThemeData(BuildContext context) {
    // var colorScheme = ColorScheme.fromSeed(
    //   seedColor: primaryColor,
    //   primary: primaryColor,
    //   secondary: secondaryColor,
    //   surface: surface,
    //   onSurface: secondaryColor,
    // );
    return CupertinoThemeData(
      brightness: MediaQuery.of(context).platformBrightness == Brightness.dark ? Brightness.dark : Brightness.light,
    );
    // return ThemeData(
    //   scaffoldBackgroundColor: scaffoldBackgroundColor,
    //   dialogBackgroundColor: AppColors.dialogBG,
    //   colorScheme: colorScheme,
    //   fontFamily: 'Consolas',
    //   appBarTheme: AppBarTheme(
    //     foregroundColor: Colors.white,
    //     backgroundColor: scaffoldBackgroundColor,
    //     centerTitle: true,
    //     iconTheme: const IconThemeData(size: 20),
    //     titleTextStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    //   ),
    //   textTheme: const TextTheme(
    //     headlineLarge: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
    //     headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    //     titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    //     titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    //     bodyLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
    //     bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
    //   ),
    //   elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //       foregroundColor: MaterialStateColor.resolveWith((states) {
    //         var color = secondaryColor;
    //         if (states.contains(MaterialState.disabled)) {
    //           color = color.withOpacity(0.5);
    //         }
    //         return color;
    //       }),
    //       backgroundColor: MaterialStateColor.resolveWith((states) {
    //         var color = primaryColor;
    //         if (states.contains(MaterialState.disabled)) {
    //           color = color.withOpacity(0.5);
    //         }
    //         return color;
    //       }),
    //       textStyle: MaterialStateTextStyle.resolveWith((states) {
    //         return const TextStyle(
    //           fontSize: 20,
    //           fontWeight: FontWeight.w600,
    //         );
    //       }),
    //     ),
    //   ),
    //   iconTheme: IconThemeData(
    //     color: secondaryColor,
    //   ),
    //   inputDecorationTheme: InputDecorationTheme(
    //     prefixIconColor: secondaryColor,
    //     suffixIconColor: secondaryColor,
    //     iconColor: secondaryColor,
    //     isDense: true,
    //     filled: true,
    //     border: const UnderlineInputBorder(
    //       borderSide: BorderSide(),
    //       borderRadius: BorderRadius.all(Radius.circular(20)),
    //     ),
    //   ),
    //   progressIndicatorTheme: ProgressIndicatorThemeData(color: secondaryColor),
    //   datePickerTheme: DatePickerThemeData(
    //     backgroundColor: surface,
    //     dividerColor: primaryColor,
    //     headerForegroundColor: Colors.white,
    //   ),
    // );
  }
}
