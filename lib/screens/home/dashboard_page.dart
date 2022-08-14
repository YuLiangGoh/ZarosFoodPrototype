import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zaros_prototype/app/app_navigator.dart';
import 'package:zaros_prototype/model/coffee.dart';
import 'package:zaros_prototype/route/app_route.dart';
import 'package:zaros_prototype/screens/home/view_items_page.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZARO PROTOTYPE'),
      ),
      body: ElevatedButton(
        onPressed: () => navigateToViewItemPage(),
        child: const Text(
          'Click me to see item',
        ),
      ),
    );
  }

  // Functions
  void navigateToViewItemPage() {
    final Coffee coffee = Coffee(
      imageUrl:
          'https://i.pinimg.com/564x/cf/2b/bb/cf2bbb6ad3e9ad31a7d63535ee8bfda6.jpg',
      name: 'Cappuccino Latte',
      description:
          'A cappuccino is an espresso-based coffee drink that originated in Italy and is prepared with steamed milk foam.',
      price: 12.88,
      review: 4.7,
      hasCoffee: true,
      hasMilk: true,
      isRoasted: true,
    );

    AppNavigator.rerouteTo(
      AppRoute.viewItems,
      arguments: ViewItemPage(coffee: coffee),
    );
  }
}
