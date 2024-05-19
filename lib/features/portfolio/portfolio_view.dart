import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/about/about_view.dart';
import 'package:srikanthkoti/features/home/home_view.dart';
import 'package:srikanthkoti/features/home/widgets/greeting.dart';
import 'package:srikanthkoti/features/home/widgets/icons_row.dart';
import 'package:srikanthkoti/features/home/widgets/job_titles.dart';
import 'package:srikanthkoti/features/portfolio/portfolio_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

class PortfolioView extends StackedView<PortfolioViewModel> {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PortfolioViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: viewModel.pageController,
        children: [],
      ),
    );
  }

  @override
  PortfolioViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PortfolioViewModel();

  @override
  void onViewModelReady(PortfolioViewModel viewModel) =>
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
