import 'package:srikanthkoti/ui/common/app_colors.dart';
import 'package:srikanthkoti/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'components/sidebar/sidebar.dart';
import 'main_layout_viewmodel.dart';

class MainLayoutView extends StackedView<MainLayoutViewModel> {
  MainLayoutView({Key? key}) : super(key: key);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget builder(
    BuildContext context,
    MainLayoutViewModel viewModel,
    Widget? child,
  ) {
    final isSmallScreen =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;
    return Scaffold(
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: canvasColor,
              title: Text(viewModel
                  .getTitleByIndex(viewModel.controller.selectedIndex)),
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      drawer: Sidebar(
        controller: viewModel.controller,
        items: viewModel.sidebarItems,
      ),
      body: Row(
        children: [
          if (!isSmallScreen)
            Sidebar(
              controller: viewModel.controller,
              items: viewModel.sidebarItems,
            ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: const NestedRouter(),
          )),
        ],
      ),
    );
  }

  @override
  MainLayoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainLayoutViewModel();
  @override
  void onViewModelReady(MainLayoutViewModel viewModel) {
    viewModel.initialize();
  }
}
