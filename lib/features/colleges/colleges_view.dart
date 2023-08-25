import 'package:srikanthkoti/features/colleges/colleges_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';

class CollegesView extends StackedView<CollegesViewModel> {
  CollegesView({Key? key}) : super(key: key);
  final _key = GlobalKey<ScaffoldState>();
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget builder(
    BuildContext context,
    CollegesViewModel viewModel,
    Widget? child,
  ) {
    final isSmallScreen =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;

    return Scaffold(
      key: _key,
      body: Row(
        children: [Text("Colleges View")],
      ),
    );
  }

  @override
  CollegesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CollegesViewModel();
  @override
  void onViewModelReady(CollegesViewModel viewModel) {
    viewModel.initialize();
  }
}
