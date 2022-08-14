import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:zaros_prototype/app/app_color.dart';

class ItemFavouriteComponent extends HookWidget {
  const ItemFavouriteComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      mainAxisAlignment: MainAxisAlignment.end,
      size: 24.w,
      circleColor:
          const CircleColor(start: Color(0xff00ddff), end: AppColors.infraRed),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: AppColors.infraRed,
        dotSecondaryColor: AppColors.infraRed,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          isLiked ? Icons.favorite : Icons.favorite_outline_rounded,
          color: isLiked ? AppColors.infraRed : Colors.white,
          size: 24.w,
        );
      },
    );
  }

  // FUNCTIONS
  void iconOnTap() {}
}
