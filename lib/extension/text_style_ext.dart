import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TextStyleExt on TextStyle {
  TextStyle putColor(Color? color) {
    return copyWith(color: color);
  }

  TextStyle putLetterSpacing(double? spacing) {
    return copyWith(letterSpacing: spacing);
  }

  TextStyle putFontSize(double fontSize) {
    return copyWith(fontSize: fontSize.sp);
  }

  TextStyle putFontStyle(FontStyle? fontStyle) {
    return copyWith(fontStyle: fontStyle);
  }
}
