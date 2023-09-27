import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Greeting extends StatelessWidget {
  const Greeting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "SRIKANTH IS MY NAME",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: isMobile ? 20.sp : 45.sp, fontWeight: FontWeight.bold),
        ),
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              '',
              cursor: '.',
              speed: const Duration(milliseconds: 100),
              textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: isMobile ? 20.sp : 45.sp,
                  ),
            ),
          ],
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
      ],
    );
  }
}
