import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppConst {
  static const double kDefaultPadding = 20.0;
  static const double kMediumPadding = 16.0;
  static const double kSmallPadding = 8.0;
  static const double kBorderRadius = 16.0;
  static const double kSmalBorderRadius = 10.0;
  static const String kfontSized = "font_size";
  static const String kFirstTime = "firstTime";
  static const String kIsPrayerLoaded = "prayerLoaded";
}

SizedBox verticalSpace(double height) {
  return SizedBox(height: height.h);
}

SizedBox horizontalSpace(double width) {
  return SizedBox(width: width.w);
}

BoxShadow getBoxShadow() {
  return BoxShadow(
    offset: Offset(0, 3),
    spreadRadius: 0,
    blurRadius: 4,
    // ignore: deprecated_member_use
    color: Colors.black.withOpacity(0.03),
  );
}
