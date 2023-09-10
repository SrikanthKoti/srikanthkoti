import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'feature_view.desktop.dart';
import 'feature_view.mobile.dart';
import 'feature_viewmodel.dart';

class FeatureView extends StackedView<FeatureViewModel> {
  const FeatureView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FeatureViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => FeatureMobile(
        viewModel: viewModel,
      ),
      desktop: (_) => FeatureDesktop(
        viewModel: viewModel,
      ),
    );
  }

  @override
  FeatureViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FeatureViewModel();

  @override
  void onViewModelReady(FeatureViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.initialise());
}
