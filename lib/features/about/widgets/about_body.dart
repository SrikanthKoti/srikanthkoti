import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({
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
        return 16.sp;
      }
    }
    if (isTablet) {
      if (textType == 'one') {
        return 36.sp;
      }
    }
    if (textType == 'one') {
      return 20.sp;
    }
    return currentFontSize != null ? 16.sp : currentFontSize!.sp;
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.tablet;

    return SizedBox(
      width: isTablet ? double.maxFinite : 800.w,
      child: RichText(
        overflow: TextOverflow.clip,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text:
                  "Oh my goodness, hello! I am a Front-End developer based in Toronto, Canada. I love long walks on the beach, writing clean code, and pushing my skills to the limit. My interests include joining an exciting team of passionate people, personal growth, and making silly faces.",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: getFontSize(context, 'one',
                      Theme.of(context).textTheme.bodyLarge!.fontSize)
                  // fontSize: 16.sp,
                  ),
            ),
            TextSpan(
              text:
                  "\n\nI used to coordinate public events in this city. Some people might be nervous to leave the exciting on-the-job learning and fulfilling teamwork dynamic behind. Personally, I'm excited to join the boring, simple, and rarely-evolving world of tech.",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: getFontSize(context, 'one',
                      Theme.of(context).textTheme.bodyLarge!.fontSize)
                  // fontSize: 16.sp
                  ),
            ),
            TextSpan(
              text:
                  "\n\nOther than coding, I love complimenting my Animal Crossing villagers, baking cookies, and making people laugh.",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: getFontSize(context, 'one',
                      Theme.of(context).textTheme.bodyLarge!.fontSize)
                  // fontSize: 16.sp
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
