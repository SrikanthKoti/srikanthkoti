import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srikanthkoti/features/about/about_view.desktop.dart';
import 'package:srikanthkoti/features/about/about_view.mobile.dart';
import 'package:srikanthkoti/features/about/about_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AboutView extends StackedView<AboutViewModel> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AboutViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        // viewModel.handleUserDrag(details, viewModel.aboutScrollController);
      },
      child: Listener(
        onPointerSignal: (PointerSignalEvent event) {
          if (event is PointerScrollEvent) {
            // viewModel.handleUserScroll(event, viewModel.aboutScrollController);
          }
        },
        child: ScreenTypeLayout.builder(
          mobile: (_) => const AboutMobile(),
          tablet: (_) => const AboutMobile(),
          desktop: (_) => const AboutDesktop(),
        ),
      ),
    );
  }

  @override
  AboutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AboutViewModel();

  @override
  void onViewModelReady(AboutViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) => viewModel.initialise());
  }
}
