// Are you a founder looking for tech ?
// Do u need to take your business to next level ?
// Are you a student trying to Get in to this world of tect
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/services/services_viewmodel.dart';
import 'package:srikanthkoti/ui/common/app_spacers.dart';
import 'package:srikanthkoti/utils/app_images.dart';
import 'package:stacked/stacked.dart';

import '../../ui/atoms/custom_svg_icon.dart';

class ServicesDesktop extends ViewModelWidget<ServicesViewModel> {
  const ServicesDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context, ServicesViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          controller: viewModel.serviceScrollController,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // UnDraw(
              //   svgPath: viewModel.serviceIcon,
              //   color: Theme.of(context).primaryColor,
              //   height: 300.h,
              //   width: 300.w,
              // ),
              // Text('What do i offer!!'),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        height24,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSvgIcon(
                              iconPath: AppImages.web,
                              name: 'Web',
                              height: 48.h,
                              width: 48.w,
                            ),
                          ],
                        ),
                        height24,
                        Text(
                          'Web development',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        height24,
                        Text(
                          'I like to code things from scratch, and enjoy bringing ideas to life in the browser.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              width24,
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        height24,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSvgIcon(
                              iconPath: AppImages.apple,
                              name: 'IOS',
                              height: 48.h,
                              width: 48.w,
                            ),
                            CustomSvgIcon(
                              iconPath: AppImages.android,
                              name: 'Android',
                              height: 48.h,
                              width: 60.w,
                            ),
                          ],
                        ),
                        height24,
                        Text(
                          'Mobile Application',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        height24,
                        Text(
                          'I like to code things from scratch, and enjoy bringing ideas to life in the browser.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              width24,
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        height24,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSvgIcon(
                              iconPath: AppImages.iot_service,
                              name: 'IoT',
                              height: 48.h,
                              width: 48.w,
                            ),
                          ],
                        ),
                        height24,
                        Text(
                          'IoT Projects',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        height24,
                        Text(
                          'I like to code things from scratch, and enjoy bringing ideas to life in the browser.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   // constraints: BoxConstraints.tight(Size.new(400.w, 400.h)),
              //   height: 400.h,
              //   width: 400.w,
              //   child: Swiper(
              //     onIndexChanged: (value) {
              //       viewModel.setServiceIcon(value);
              //     },
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: EdgeInsets.only(
              //             left: 24.w, right: 30.w, top: 24.h, bottom: 24.h),
              //         child: Card(
              //           elevation: 5,
              //           child: Text("$index Web Designing"),
              //         ),
              //       );
              //     },
              //     itemCount: 3,
              //     control: const SwiperControl(),
              //     duration: 1000,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
