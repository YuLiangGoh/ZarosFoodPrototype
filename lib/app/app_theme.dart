import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaros_prototype/app/app_color.dart';

class AppTheme {
  AppTheme._();

  static final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.peru,
    primary: AppColors.peru,
    secondary: AppColors.chineseBlack,
  );

  /// Elevated Button Theme Data
  static final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.peru,
      padding: EdgeInsets.zero,
      elevation: 0,
      minimumSize: Size.fromHeight(52.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  /// The design for the based applications.
  static var defaultThemeData = ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.cultured,
    elevatedButtonTheme: elevatedButtonThemeData,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      },
    ),
  );
}
