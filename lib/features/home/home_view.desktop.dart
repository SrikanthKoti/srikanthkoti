import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/home/home_viewmodel.dart';
import 'package:srikanthkoti/features/home/widgets/greeting.dart';
import 'package:srikanthkoti/features/home/widgets/icons_row.dart';
import 'package:srikanthkoti/features/home/widgets/job_titles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Greeting(),
              JobTitles(),
              SizedBox(
                height: 20.spMax,
              ),
              IconsRow(),
            ],
          ),
        ),
      ),
    );
  }
}
