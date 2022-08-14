import 'package:flutter/material.dart';
import 'package:zaros_prototype/app/app_color.dart';

class FadeOutPageRoute<T> extends PageRoute<T> {
  FadeOutPageRoute(this.child);
  @override
  Color get barrierColor => AppColors.white.withOpacity(0.4);

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);
}
