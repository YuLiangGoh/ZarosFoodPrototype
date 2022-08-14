import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Get the current screen context that the user could see.
  static BuildContext? getContext() {
    try {
      return navigatorKey.currentContext;
    } on Exception catch (e) {
      throw Exception('Get Navigator Context Failed : $e');
    }
  }

  /// Reroute to the desired screen
  static Future<void> rerouteTo(String route,
      {dynamic arguments, Function(dynamic)? then}) async {
    try {
      await Navigator.of(getContext()!)
          .pushNamed(route, arguments: arguments)
          .then(
        (value) {
          if (then != null) then(value);
        },
      );
    } on Exception catch (e) {
      throw Exception('Reroute Failed : $e');
    }
  }

  /// Pop the currently visible screen
  static void pop({dynamic result}) {
    try {
      Navigator.of(getContext()!).pop(result);
    } on Exception catch (e) {
      throw Exception('Pop Failed : $e');
    }
  }

  /// Replace the current screen with the page you desire.
  static Future<void> replaceAndRerouteTo(String route,
      {dynamic arguments}) async {
    try {
      await Navigator.of(getContext()!)
          .pushReplacementNamed(route, arguments: arguments);
    } on Exception catch (e) {
      throw Exception('Replace and Reroute Failed : $e');
    }
  }

  /// Push the given route onto the navigator, and then remove all the 
  /// previous routes
  static Future<void> replaceAllAndRerouteTo(Widget route,
      {dynamic arguments}) async {
    try {
      await Navigator.of(getContext()!).pushAndRemoveUntil<void>(
        MaterialPageRoute<void>(builder: (BuildContext context) => route),
        ModalRoute.withName('/'),
      );
    } on Exception catch (e) {
      throw Exception('Replace All and Reroute Failed : $e');
    }
  }
}
