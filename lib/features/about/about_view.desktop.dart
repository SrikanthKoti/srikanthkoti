import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/about/about_viewmodel.dart';
import 'package:srikanthkoti/features/about/widgets/about_body.dart';
import 'package:srikanthkoti/features/about/widgets/about_header.dart';
import 'package:srikanthkoti/features/about/widgets/portfolio_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AboutDesktop extends ViewModelWidget<AboutViewModel> {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context, AboutViewModel viewModel) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        controller: viewModel.aboutScrollController,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 5.w,
            ),
            const PortfolioImage(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AboutHeader(),
                SizedBox(
                  height: 30.h,
                ),
                const AboutBody(),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
