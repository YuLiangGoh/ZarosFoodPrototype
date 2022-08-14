import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zaros_prototype/app/app_color.dart';
import 'package:zaros_prototype/app/app_padding.dart';
import 'package:zaros_prototype/app/app_text_style.dart';
import 'package:zaros_prototype/const/enum.dart';
import 'package:zaros_prototype/const/image_path.dart';
import 'package:zaros_prototype/const/lottie_path.dart';
import 'package:zaros_prototype/extension/text_style_ext.dart';
import 'package:zaros_prototype/screens/home/components/image_details.dart';

class CoffeeSizeSelectionComponent extends HookWidget {
  CoffeeSizeSelectionComponent({Key? key, required this.onSelected})
      : super(key: key);

  final Function(CoffeeSize) onSelected;

  final List<CoffeeSize> coffeeSizeList = [
    CoffeeSize.small,
    CoffeeSize.medium,
    CoffeeSize.large
  ];

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState(0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: AppTextStyle.inter_semi_bold
              .putFontSize(16)
              .putColor(AppColors.black),
        ),
        Padding(
          padding: AppPadding.widgetBetweenTopPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              coffeeSizeList.length,
              (index) => GestureDetector(
                onTap: () {
                  selectedValue.value = index;
                  onSelected(coffeeSizeList[index]);
                },
                child: Stack(
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 80.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageDetailsComponent(
                            title: getTitle(
                              coffeeSizeList[index],
                            ),
                            label: getTitle(
                              coffeeSizeList[index],
                            ),
                            imgSrc: getIcon(
                              coffeeSizeList[index],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (selectedValue.value == index)
                      Lottie.asset(
                        lottieCircle,
                        frameRate: FrameRate.max,
                        width: 80.w,
                        repeat: false,
                      ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  // Function
  String getTitle(CoffeeSize coffeeSize) {
    switch (coffeeSize) {
      case CoffeeSize.small:
        return 'Small';
      case CoffeeSize.medium:
        return 'Medium';
      case CoffeeSize.large:
        return 'Large';
    }
  }

  String getIcon(CoffeeSize coffeeSize) {
    switch (coffeeSize) {
      case CoffeeSize.small:
        return imageCupSmall;
      case CoffeeSize.medium:
        return imageCupMedium;
      case CoffeeSize.large:
        return imageCupLarge;
    }
  }
}
