import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaros_prototype/app/app_color.dart';
import 'package:zaros_prototype/app/app_padding.dart';
import 'package:zaros_prototype/app/app_text_style.dart';
import 'package:zaros_prototype/extension/text_style_ext.dart';

class QuantitySelectionComponent extends HookWidget {
  const QuantitySelectionComponent({Key? key, required this.coffeePrice})
      : super(key: key);

  final double coffeePrice;

  @override
  Widget build(BuildContext context) {
    final counter = useState(1);
    final price = useState(coffeePrice);

    useEffect(() {
      price.value = counter.value * coffeePrice;
      return;
    }, [counter.value]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Quantity',
          style: AppTextStyle.inter_semi_bold
              .putFontSize(16)
              .putColor(AppColors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: AppPadding.widgetBetweenTopPadding,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.davysGrey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    onTap: () {
                      if (counter.value > 1) {
                        counter.value--;
                      }
                    },
                    child: Padding(
                      padding: AppPadding.innerContainerSmallPadding,
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.peru,
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppPadding.innerContainerSmallPadding,
                    child: SizedBox(
                      width: 20.w,
                      child: Center(
                        child: Text(
                          counter.value.toString(),
                          style: AppTextStyle.inter_bold
                              .putFontSize(14)
                              .putColor(AppColors.peru),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    onTap: () {
                      if (counter.value < 9999) {
                        counter.value++;
                      }
                    },
                    child: Padding(
                      padding: AppPadding.innerContainerSmallPadding,
                      child: const Icon(
                        Icons.add,
                        color: AppColors.peru,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: AppPadding.widgetBetweenTopPadding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'RM',
                    style: AppTextStyle.inter_bold
                        .putFontSize(16)
                        .putColor(AppColors.peru),
                  ),
                  Padding(
                    padding: AppPadding.textBetweenLeftPadding,
                    child: AnimatedFlipCounter(
                      value: price.value,
                      fractionDigits: 2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastLinearToSlowEaseIn,
                      textStyle: AppTextStyle.inter_semi_bold
                          .putFontSize(24)
                          .putColor(AppColors.peru),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
