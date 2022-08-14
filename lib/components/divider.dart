import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zaros_prototype/app/app_color.dart';

class AppHorizontalDivider extends HookWidget {
  const AppHorizontalDivider({Key? key, this.thickness}) : super(key: key);

  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: thickness ?? 1,
      color: AppColors.graniteGray.withOpacity(0.3),
    );
  }
}
