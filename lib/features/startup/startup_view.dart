import 'package:srikanthkoti/features/startup/startup_view.desktop.dart';
import 'package:srikanthkoti/features/startup/startup_view.mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      // breakpoints:     const ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
      mobile: (_) => StartupMobile(
        viewModel: viewModel,
      ),
      desktop: (_) => StartupDesktop(
        viewModel: viewModel,
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
