import 'package:expense_app/app/providers/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => _lightThemeData;

  static ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),
    scaffoldBackgroundColor: Colors.purple.shade300,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: .w600),
      titleMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
      labelLarge: TextStyle(color: Colors.grey, fontWeight: .w400),
    ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
      )
  );



}