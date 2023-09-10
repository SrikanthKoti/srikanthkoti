import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/about/about_viewmodel.dart';
import 'package:srikanthkoti/features/about/widgets/about_body.dart';
import 'package:srikanthkoti/features/about/widgets/about_header.dart';
import 'package:srikanthkoti/features/about/widgets/portfolio_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AboutMobile extends ViewModelWidget<AboutViewModel> {
  const AboutMobile({super.key});

  @override
  Widget build(BuildContext context, AboutViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PortfolioImage(),
              const AboutHeader(),
              SizedBox(
                height: 30.h,
              ),
              const AboutBody(),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
