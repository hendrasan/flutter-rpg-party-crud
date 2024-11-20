import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(162, 29, 19, 1);
  static Color primaryAccent = const Color.fromRGBO(120, 14, 14, 1);
  static Color secondaryColor = const Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = const Color.fromRGBO(30, 30, 30, 1);
  static Color titleColor = const Color.fromRGBO(210, 210, 210, 1);
  static Color textColor = const Color.fromRGBO(180, 180, 180, 1);
  static Color successColor = const Color.fromRGBO(5, 190, 80, 1);
  static Color highightColor = const Color.fromRGBO(220, 160, 10, 1);
}

ThemeData primaryTheme = ThemeData(
  // seed color
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

  // scaffold color
  scaffoldBackgroundColor: AppColors.secondaryAccent,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: AppColors.titleColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
    ),
    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
    ),
    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: 1,
    ),
  ),
  cardTheme: CardTheme(
    color: AppColors.secondaryColor.withOpacity(0.6),
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(),
    // shadowColor: Colors.transparent,
    shadowColor: AppColors.secondaryAccent,
    elevation: 4,
    margin: const EdgeInsets.only(bottom: 16),
  ),

  // inputs decoration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondaryColor.withOpacity(0.5),
    border: InputBorder.none,
    labelStyle: TextStyle(
      color: AppColors.primaryAccent,
    ),
    prefixIconColor: AppColors.textColor,
  ),

  // dialog theme
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.secondaryAccent,
    surfaceTintColor: Colors.transparent,
  ),
);
