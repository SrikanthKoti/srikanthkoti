import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srikanthkoti/ui/atoms/animated_cursor.dart';
import 'package:srikanthkoti/ui/atoms/custom_icon.dart';
import 'package:srikanthkoti/ui/atoms/translate_on_hover.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({
    super.key,
  });
  double getFontSize(
      BuildContext context, String textType, double? currentFontSize) {
    bool isMobile =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;
    bool isTablet =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.tablet;
    if (isMobile) {
      if (textType == 'one') {
        return 24.sp;
      }
      if (textType == 'two') {
        return 36.sp;
      }
    }
    if (isTablet) {
      if (textType == 'one') {
        return 70.sp;
      }
      if (textType == 'two') {
        return 65.sp;
      }
    }
    if (textType == 'one') {
      return 24.sp;
    }
    if (textType == 'two') {
      return 57.sp;
    }
    return currentFontSize != null ? 18.sp : currentFontSize!.sp;
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Hi",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: getFontSize(context, 'one',
                      Theme.of(context).textTheme.headlineSmall!.fontSize)
                  // fontSize: isMobile ? 18.sp : 24.sp,
                  ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  '',
                  cursor: ',',
                  speed: const Duration(milliseconds: 100),
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: getFontSize(
                              context,
                              'one',
                              Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .fontSize)
                          // fontSize: isMobile ? 18.sp : 24.sp,
                          ),
                ),
              ],
              repeatForever: true,
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            Text(
              "I am",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: getFontSize(context, 'one',
                      Theme.of(context).textTheme.headlineSmall!.fontSize)
                  // fontSize: isMobile ? 18.sp : 24.sp,
                  ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Srikanth',
              // speed: const Duration(milliseconds: 100),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: getFontSize(context, 'two',
                      Theme.of(context).textTheme.displayLarge!.fontSize),
                  color: Theme.of(context).textTheme.displayLarge!.color
                  // fontSize: isMobile ? 32.sp : 57.sp,
                  ),
            ),
            Text(
              ' Koti',
              // speed: const Duration(milliseconds: 100),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: getFontSize(context, 'two',
                      Theme.of(context).textTheme.displayLarge!.fontSize),
                  color: Theme.of(context).textTheme.displayLarge!.color
                  // fontSize: isMobile ? 32.sp : 57.sp,
                  ),
            ),
            AnimatedCursor(
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: getFontSize(context, 'two',
                        Theme.of(context).textTheme.displayLarge!.fontSize),
                  ),
            ),
            if (!isMobile)
              Row(
                children: [
                  TranslateOnHover(
                    child: CustomIcon(
                      iconData: FontAwesomeIcons.github,
                      // size: isMobile ? 16.w : 24.w,
                    ),
                  ),
                  TranslateOnHover(
                    child: CustomIcon(
                      iconData: FontAwesomeIcons.linkedinIn,
                      // size: isMobile ? 16.w : 24.w,
                    ),
                  ),
                  TranslateOnHover(
                    child: CustomIcon(
                      iconData: FontAwesomeIcons.filePdf,
                      // size: isMobile ? 16.w : 24.w,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
