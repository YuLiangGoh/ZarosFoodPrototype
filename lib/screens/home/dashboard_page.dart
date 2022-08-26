import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaros_prototype/app/app_color.dart';
import 'package:zaros_prototype/app/app_navigator.dart';
import 'package:zaros_prototype/app/app_padding.dart';
import 'package:zaros_prototype/app/app_text_style.dart';
import 'package:zaros_prototype/const/image_path.dart';
import 'package:zaros_prototype/extension/text_style_ext.dart';
import 'package:zaros_prototype/model/coffee.dart';
import 'package:zaros_prototype/route/app_route.dart';
import 'package:zaros_prototype/screens/home/view_items_page.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        leadingWidth: 60.w,
        actions: [
          profileImage(),
        ],
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: Column(
            children: [
              message(),
              searchBar(),
            ],
          ),
        ),
      ),
    );
  }

  // Widgets
  Widget profileImage() {
    return Center(
      child: Container(
        width: 45.w,
        height: 45.w,
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.graniteGray.withOpacity(0.2),
        ),
        margin: AppPadding.horizontalPadding,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageProfile,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget message() {
    return SizedBox(
      child: Text(
        'Find the best coffee for you',
        style: AppTextStyle.mali_bold.putFontSize(32),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: AppPadding.componentBetweenTopPadding,
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.white,
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 24.w,
          ),
          hintText: 'Find Your Coffee',
          hintStyle: AppTextStyle.inter_medium
              .putFontSize(12)
              .putColor(AppColors.graniteGray),
        ),
      ),
    );
  }

  // Functions
  void navigateToViewItemPage() {
    final Coffee coffee = Coffee(
      imageUrl:
          'https://i.pinimg.com/564x/cf/2b/bb/cf2bbb6ad3e9ad31a7d63535ee8bfda6.jpg',
      name: 'Cappuccino Latte',
      description:
          'A cappuccino is an espresso-based coffee drink that originated in Italy and is prepared with steamed milk foam.',
      price: 12.88,
      review: 4.7,
      hasCoffee: true,
      hasMilk: true,
      isRoasted: true,
    );

    AppNavigator.rerouteTo(
      AppRoute.viewItems,
      arguments: ViewItemPage(coffee: coffee),
    );
  }
}
