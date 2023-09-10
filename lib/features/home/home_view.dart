import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:srikanthkoti/features/home/home_view.desktop.dart';
import 'package:srikanthkoti/features/home/home_view.mobile.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);
  final _key = GlobalKey<ScaffoldState>();
  final _controller = SidebarXController(
    selectedIndex: 0,
    extended: true,
  );

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final isSmallScreen =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;

    return ScreenTypeLayout.builder(
      mobile: (_) => const HomeMobile(),
      desktop: (_) => const HomeDesktop(),
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
