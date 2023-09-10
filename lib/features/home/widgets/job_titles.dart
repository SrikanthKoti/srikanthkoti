import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srikanthkoti/features/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class JobTitles extends ViewModelWidget<HomeViewModel> {
  const JobTitles({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    bool isMobile =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          onNext: (p0, p1) {
            if (p0 == 1) {
              viewModel.setText("Engineer");
            } else {
              viewModel.setText("Developer");
            }
          },
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              'Web',
              speed: Duration(milliseconds: 200),
              textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: isMobile ? 35.sp : 108.sp,
                  ),
            ),
            TypewriterAnimatedText(
              'Flutter',
              speed: Duration(milliseconds: 200),
              textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: isMobile ? 35.sp : 108.sp,
                  ),
            ),
            TypewriterAnimatedText(
              'IoT',
              speed: Duration(milliseconds: 200),
              textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: isMobile ? 35.sp : 108.sp,
                  ),
            ),
            TypewriterAnimatedText(
              'Cloud',
              speed: Duration(milliseconds: 200),
              textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: isMobile ? 35.sp : 108.sp,
                  ),
            ),
          ],
          totalRepeatCount: 4,
          pause: const Duration(milliseconds: 500),
          displayFullTextOnTap: true,
          // stopPauseOnTap: true,
        ),
        Text(
          viewModel.text,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                overflow: TextOverflow.visible,
                fontSize: isMobile ? 35.sp : 108.sp,
              ),
        ),
      ],
    );
  }
}
