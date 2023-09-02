import 'package:srikanthkoti/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

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
    final isMobile =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;
    final isTablet =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.tablet;

    return Scaffold(
      key: _key,
      appBar: isMobile
          ? AppBar(
              title: Text("Srikanth Koti"),
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      drawer: isMobile
          ? Drawer(
              width: 150,
              child: NavRail(isTablet: isTablet),
            )
          : null,
      body: Row(
        children: [
          if (!isMobile) NavRail(isTablet: isTablet),
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

class NavRail extends ViewModelWidget<MainLayoutViewModel> {
  const NavRail({
    super.key,
    required this.isTablet,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context, MainLayoutViewModel viewModel) {
    return NavigationRail(
      selectedIconTheme: viewModel.themeService
          .getTheme()
          .navigationRailTheme
          .selectedIconTheme,
      unselectedIconTheme: viewModel.themeService
          .getTheme()
          .navigationRailTheme
          .unselectedIconTheme,
      extended: !isTablet,
      minExtendedWidth: 200,
      selectedIndex: viewModel.selectedIndex,
      groupAlignment: -1.0,
      onDestinationSelected: (int index) {
        viewModel.onClickNavItem(index);
      },
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Srikanth',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'Koti',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          GestureDetector(
            child: Icon(
              Icons.dark_mode,
            ),
            onTap: viewModel.toggleThemeMode,
          )
        ],
      ),
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.home_filled),
          label: Text(
            'Home',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.book),
          selectedIcon: Icon(Icons.book),
          label: Text(
            'Experience',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.workspace_premium),
          selectedIcon: Icon(Icons.star),
          label: Text(
            'Projects',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.star_border),
          selectedIcon: Icon(Icons.article),
          label: Text(
            'Blog',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
      trailing: Column(
        children: [
          Icon(
            Icons.keyboard_double_arrow_left_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
