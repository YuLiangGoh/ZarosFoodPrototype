import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zaros_prototype/app/app_text_style.dart';
import 'package:zaros_prototype/extension/text_style_ext.dart';

class AppPrimaryButton extends HookWidget {
  const AppPrimaryButton(
      {Key? key, required this.buttonTitle, required this.onPressed})
      : super(key: key);

  final String buttonTitle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        textAlign: TextAlign.center,
        style: AppTextStyle.inter_bold.putFontSize(16),
      ),
    );
  }
}
