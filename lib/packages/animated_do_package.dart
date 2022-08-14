import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimatedDoHelper {
  AnimatedDoHelper._();

  static const bool animated = true;
  static const int delayDurationInMilliSeconds = 250;

  static Widget fadeIn({required Widget child, int index = 0}) {
    return FadeIn(
      duration: const Duration(milliseconds: 800),
      animate: animated,
      delay: Duration(milliseconds: delayDurationInMilliSeconds * index),
      child: child,
    );
  }

  static Widget fadeInRight({required Widget child, int index = 0}) {
    return FadeInRight(
      animate: animated,
      delay: Duration(milliseconds: delayDurationInMilliSeconds * index),
      child: child,
    );
  }

  static Widget fadeInLeft({required Widget child, int index = 0}) {
    return FadeInLeft(
      animate: animated,
      delay: Duration(milliseconds: delayDurationInMilliSeconds * index),
      child: child,
    );
  }

  static Widget fadeInUp({required Widget child, int index = 0}) {
    return FadeInUp(
      animate: animated,
      delay: Duration(milliseconds: delayDurationInMilliSeconds * index),
      child: child,
    );
  }

  static Widget fadeInDown({required Widget child, int index = 0}) {
    return FadeInDown(
      animate: animated,
      delay: Duration(milliseconds: delayDurationInMilliSeconds * index),
      child: child,
    );
  }
}
