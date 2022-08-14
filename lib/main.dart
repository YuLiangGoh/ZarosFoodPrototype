import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaros_prototype/app/app_navigator.dart';
import 'package:zaros_prototype/app/app_route.dart';
import 'package:zaros_prototype/app/app_theme.dart';
import 'package:zaros_prototype/screens/splash/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const double designScreenWidth = 375;
  static const double designScreenHeight = 812;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(designScreenWidth, designScreenHeight),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          navigatorKey: AppNavigator.navigatorKey,
          title: 'Flutter Demo',
          theme: AppTheme.defaultThemeData,
          onGenerateRoute: AppRoute.generateRoute,
          home: const SplashScreenPage(),
        );
      },
    );
  }
}
