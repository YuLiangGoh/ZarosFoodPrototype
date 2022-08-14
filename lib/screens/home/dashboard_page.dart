import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zaros_prototype/app/app_navigator.dart';
import 'package:zaros_prototype/route/app_route.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZARO PROTOTYPE'),
      ),
      body: ElevatedButton(
        onPressed: () => AppNavigator.rerouteTo(AppRoute.viewItems),
        child: const Text(
          'Click me to see item',
        ),
      ),
    );
  }
}
