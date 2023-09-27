import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/services/services_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../ui/atoms/custom_svg_icon.dart';
import '../../ui/common/app_spacers.dart';
import '../../utils/app_images.dart';

class ServicesMobile extends ViewModelWidget<ServicesViewModel> {
  const ServicesMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context, ServicesViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          controller: viewModel.serviceScrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Expanded(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
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
                  height24,
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
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
                  height24,
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
