import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srikanthkoti/features/about/about_view.desktop.dart';
import 'package:srikanthkoti/features/about/about_view.mobile.dart';
import 'package:srikanthkoti/features/skills/skills_view.desktop.dart';
import 'package:srikanthkoti/features/skills/skills_view.mobile.dart';
import 'package:srikanthkoti/features/skills/skills_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SkillsView extends StackedView<SkillsViewModel> {
  const SkillsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SkillsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => SkillsMobile(),
      desktop: (_) => SkillsDesktop(),
    );
  }

  @override
  SkillsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SkillsViewModel();

  @override
  void onViewModelReady(SkillsViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.initialise());
}
