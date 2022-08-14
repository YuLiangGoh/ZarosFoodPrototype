import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zaros_prototype/app/app_color.dart';
import 'package:zaros_prototype/app/app_padding.dart';
import 'package:zaros_prototype/app/app_text_style.dart';
import 'package:zaros_prototype/extension/text_style_ext.dart';

class ImageDetailsComponent extends HookWidget {
  const ImageDetailsComponent(
      {Key? key,
      required this.title,
      required this.label,
      required this.imgSrc})
      : super(key: key);

  final String title;
  final String label;
  final String imgSrc;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Padding(
        padding: AppPadding.innerContainerPadding,
        child: Column(
          children: [
            Image.asset(
              imgSrc,
              width: 28,
            ),
            Padding(
              padding: AppPadding.textBetweenTopPadding,
              child: Text(
                title,
                style: AppTextStyle.inter_medium
                    .putFontSize(12)
                    .putColor(AppColors.davysGrey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
