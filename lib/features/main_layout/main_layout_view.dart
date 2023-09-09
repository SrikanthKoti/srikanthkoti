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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: FloatingActionButton(
          onPressed: () => {viewModel.toggleThemeMode()},
          child: Icon(Icons.light_mode),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      appBar: AppBar(
        title: Text("Srikanth Koti"),
        leading: IconButton(
          onPressed: () {
            // viewModel.navigationKey.currentState?
            // isMobile ?
            // _key.currentState?.openDrawer() : ;
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      drawer: isMobile
          ? Drawer(
              width: 200,
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
      key: viewModel.navigationKey,
      selectedIconTheme:
          Theme.of(context).navigationRailTheme.selectedIconTheme,
      unselectedIconTheme:
          Theme.of(context).navigationRailTheme.unselectedIconTheme,
      selectedLabelTextStyle: Theme.of(context)
          .navigationRailTheme
          .selectedLabelTextStyle!
          .copyWith(
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          ),
      unselectedLabelTextStyle: Theme.of(context)
          .navigationRailTheme
          .unselectedLabelTextStyle!
          .copyWith(
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          ),
      extended: !isTablet,
      // labelType:
      //     !isTablet ? NavigationRailLabelType.all : NavigationRailLabelType.all,
      minExtendedWidth: 200,
      selectedIndex: viewModel.selectedIndex,
      onDestinationSelected: (int index) {
        viewModel.onClickNavItem(index);
      },
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            !isTablet ? 'Srikanth' : 'SK',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          if (!isTablet)
            Text(
              'Koti',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          SizedBox(
            height: 60,
          )
        ],
      ),
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.home_filled),
          label: Text(
            'Home',
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.book),
          selectedIcon: Icon(Icons.book),
          label: Text(
            'Experience',
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.workspace_premium),
          selectedIcon: Icon(Icons.star),
          label: Text(
            'Projects',
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.star_border),
          selectedIcon: Icon(Icons.article),
          label: Text(
            'Blog',
          ),
        ),
      ],
    );
  }
}
