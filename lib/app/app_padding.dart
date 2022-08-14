import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaros_prototype/app/app_navigator.dart';

class AppPadding {
  AppPadding._();

  static final horizontalPadding = EdgeInsets.symmetric(horizontal: 24.w);

  static final bottomExtraSpacePadding = EdgeInsets.only(bottom: 60.h);

    static final bottomExtraSmallSpacePadding = EdgeInsets.only(bottom: 30.h);

  static final topStatusBarPadding =
      MediaQuery.of(AppNavigator.getContext()!).padding.top;

  static final textBetweenTopPadding = EdgeInsets.only(top: 4.h);
  static final textBetweenLeftPadding = EdgeInsets.only(left: 4.h);

  static final componentBetweenTopPadding = EdgeInsets.only(top: 24.h);

  static final componentBetweenBotPadding = EdgeInsets.only(bottom: 24.h);

  static final widgetBetweenTopPadding = EdgeInsets.only(top: 12.h);

  static final widgetBetweenBotPadding = EdgeInsets.only(bottom: 12.h);

  static final widgetBetweenLeftPadding = EdgeInsets.only(left: 12.w);

  static final innerContainerPadding = EdgeInsets.all(14.w);
  static final innerContainerSmallPadding = EdgeInsets.all(8.w);

  static final slimBorderPadding = EdgeInsets.all(3.w);

  static final tagPadding = EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h);
}
