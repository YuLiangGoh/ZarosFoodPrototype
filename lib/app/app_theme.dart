import 'package:flutter/material.dart';
import 'package:zaros_prototype/app/app_color.dart';

class AppTheme {
  AppTheme._();

  static final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.peru,
    primary: AppColors.peru,
    secondary: AppColors.chineseBlack,
  );

  /// The design for the based applications.
  static var defaultThemeData = ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.white,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      },
    ),
  );
}
