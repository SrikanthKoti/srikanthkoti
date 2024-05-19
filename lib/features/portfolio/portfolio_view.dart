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
      body: Column(
        children: [
          PageView(
            children: [],
          )
        ],
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
