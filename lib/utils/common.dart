import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

double getFontSize(
    BuildContext context, String textType, double? currentFontSize) {
  bool isMobile =
      getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;
  bool isTablet =
      getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.tablet;
  if (isMobile) {
    if (textType == 'headlineSmall') {
      return 18.sp;
    }
    if ((textType == 'displayLarge')) {
      return 32.sp;
    }
  }
  if (isTablet) {
    if (textType == 'headlineSmall') {
      return 36.sp;
    }
    if ((textType == 'displayLarge')) {
      return 57.sp;
    }
  }
  return currentFontSize != null ? 18.sp : currentFontSize!.sp;
}
