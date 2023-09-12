import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srikanthkoti/features/home/home_view.desktop.dart';
import 'package:srikanthkoti/features/home/home_view.mobile.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        viewModel.handleUserDrag(details, viewModel.homeScrollController);
      },
      child: Listener(
        onPointerSignal: (PointerSignalEvent event) {
          if (event is PointerScrollEvent) {
            viewModel.handleUserScroll(event, viewModel.homeScrollController);
          }
        },
        child: ScreenTypeLayout.builder(
          mobile: (_) => const HomeMobile(),
          desktop: (_) => const HomeDesktop(),
          tablet: (_) => const HomeDesktop(),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.initialize();
  }
}
