import 'package:flutter/material.dart';
import 'package:zaros_prototype/screens/home/dashboard_page.dart';
import 'package:zaros_prototype/screens/home/view_items_page.dart';

class AppRoute {
  AppRoute._();

  static const String dashboard = '/dashboard';
  static const String viewItems = '/items';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DashboardPage(),
        );
      case viewItems:
      final args = settings.arguments as ViewItemPage;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>  ViewItemPage(coffee: args.coffee,),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
