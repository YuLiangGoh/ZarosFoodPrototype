import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaros_prototype/app/app_color.dart';
import 'package:zaros_prototype/app/app_navigator.dart';
import 'package:zaros_prototype/app/app_padding.dart';
import 'package:zaros_prototype/app/app_text_style.dart';
import 'package:zaros_prototype/components/divider.dart';
import 'package:zaros_prototype/components/primary_button.dart';
import 'package:zaros_prototype/const/image_path.dart';
import 'package:zaros_prototype/extension/text_style_ext.dart';
import 'package:zaros_prototype/model/coffee.dart';
import 'package:zaros_prototype/packages/animated_do_package.dart';
import 'package:zaros_prototype/screens/home/components/coffee_size_selection.dart';
import 'package:zaros_prototype/screens/home/components/image_details.dart';
import 'package:zaros_prototype/screens/home/components/like_button.dart';
import 'package:zaros_prototype/screens/home/components/quantity_selection.dart';

class ViewItemPage extends HookWidget {
  const ViewItemPage({Key? key, required this.coffee}) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            header(),
            body(),
          ],
        ),
      ),
      bottomNavigationBar: footer(),
    );
  }

  // Widgets

  /// Widgets that contains appbar, image with the reviews
  Widget header() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Image.network(
            coffee.imageUrl ?? '',
            height: 0.5.sh,
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
        ),
        Positioned(
          top: 12.w + MediaQuery.of(AppNavigator.getContext()!).padding.top,
          left: 12.w,
          child: ElevatedButton(
            onPressed: () => AppNavigator.pop(),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(6.w),
              primary: AppColors.black.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              minimumSize: Size(32.w, 32.w),
            ),
            child: const Icon(
              Icons.chevron_left_rounded,
              color: AppColors.white,
              size: 32,
            ),
          ),
        ),
        Positioned(
          top: 12.w + MediaQuery.of(AppNavigator.getContext()!).padding.top,
          right: 12.w,
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: AppColors.black.withOpacity(0.4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ItemFavouriteComponent(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Padding(
      padding:
          AppPadding.horizontalPadding.add(AppPadding.widgetBetweenTopPadding),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedDoHelper.fadeIn(
              child: Text(
                coffee.name ?? 'A Coffee',
                style: AppTextStyle.inter_bold.putFontSize(28),
              ),
            ),
            AnimatedDoHelper.fadeInRight(
              index: 1,
              child: extraDetails(),
            ),
            Padding(
              padding: AppPadding.widgetBetweenTopPadding,
              child: const AppHorizontalDivider(),
            ),
            AnimatedDoHelper.fadeInRight(
              index: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: AppPadding.widgetBetweenTopPadding,
                    child: Text(
                      'Description',
                      style: AppTextStyle.inter_semi_bold
                          .putFontSize(16)
                          .putColor(AppColors.black),
                    ),
                  ),
                  Padding(
                    padding: AppPadding.textBetweenTopPadding,
                    child: Text(
                      coffee.description ?? 'No Description.',
                      style: AppTextStyle.inter_medium
                          .putFontSize(14)
                          .putColor(AppColors.graniteGray),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedDoHelper.fadeInRight(
              index: 3,
              child: Padding(
                padding: AppPadding.widgetBetweenTopPadding,
                child: CoffeeSizeSelectionComponent(
                  onSelected: (coffeeSize) {},
                ),
              ),
            ),
            AnimatedDoHelper.fadeInRight(
              index: 4,
              child: Padding(
                padding: AppPadding.widgetBetweenTopPadding
                    .add(AppPadding.bottomExtraSmallSpacePadding),
                child: QuantitySelectionComponent(
                  coffeePrice: coffee.price ?? 0.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget extraDetails() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.peru,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: AppPadding.widgetBetweenTopPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (coffee.hasCoffee ?? false)
            AnimatedDoHelper.fadeIn(
              index: 3,
              child: const ImageDetailsComponent(
                  imgSrc: imageCoffeeBean,
                  title: 'Coffee',
                  label: 'This beverages contains caffeine.'),
            ),
          if (coffee.hasMilk ?? false)
            AnimatedDoHelper.fadeIn(
              index: 3,
              child: const ImageDetailsComponent(
                  imgSrc: imageMilk,
                  title: 'Milk',
                  label: 'This beverages contains milk.'),
            ),
          if (coffee.isRoasted ?? false)
            AnimatedDoHelper.fadeIn(
              index: 3,
              child: const ImageDetailsComponent(
                  imgSrc: imageRoasted,
                  title: 'Roasted',
                  label: 'This beverages is roasted.'),
            ),
        ],
      ),
    );
  }

  Widget detailsContainer(
      {required String title, required String label, required String imgSrc}) {
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

  Widget footer() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -2),
            color: AppColors.davysGrey.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      padding: AppPadding.horizontalPadding
          .add(AppPadding.componentBetweenBotPadding)
          .add(AppPadding.componentBetweenTopPadding),
      child: AppPrimaryButton(
        buttonTitle: 'Add to Cart',
        onPressed: () => AppNavigator.pop(),
      ),
    );
  }
}
