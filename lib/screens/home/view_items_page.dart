import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaros_prototype/app/app_color.dart';
import 'package:zaros_prototype/app/app_navigator.dart';

class ViewItemPage extends HookWidget {
  const ViewItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1.0.sh,
          child: Column(
            children: [
              header(),
            ],
          ),
        ),
      ),
    );
  }

  // Widgets

  /// Widgets that contains appbar, image with the reviews
  Widget header() {
    return Stack(
      children: [
        Image.network(
          'https://i.pinimg.com/564x/29/7c/8e/297c8ea6ee897c728294f846898de259.jpg',
          height: 0.6.sh,
          width: double.infinity,
          fit: BoxFit.cover,
          // loadingBuilder: (context, child, loadingProgress) {
          //   if (loadingProgress == null) {
          //     return child;
          //   }
          //   return Container(
          //     width: double.infinity,
          //     height: 0.6.sh,
          //     color: AppColors.peru.withOpacity(0.8),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Lottie.asset(
          //           lottieLoading,
          //           width: 0.5.sw,
          //         ),
          //       ],
          //     ),
          //   );
          // },
        ),
        Positioned(
          top: 12.w + MediaQuery.of(AppNavigator.getContext()!).padding.top,
          left: 12.w,
          child: ElevatedButton(
            onPressed: () => AppNavigator.pop(),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(12.w),
              primary: AppColors.white.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              minimumSize: Size(32.w, 32.w),
            ),
            child: const Icon(
              Icons.chevron_left_rounded,
              color: AppColors.black,
              size: 32,
            ),
          ),
        )
      ],
    );
  }
}
