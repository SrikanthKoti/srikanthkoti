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
    int _selectedIndex = 0;

    NavigationRailLabelType labelType = NavigationRailLabelType.all;
    bool showLeading = true;
    bool showTrailing = true;
    double groupAlignment = 0.0;
    final isMobile =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;
    final isTablet =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.tablet;

    return Scaffold(
      key: _key,
      appBar: isMobile
          ? AppBar(
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
      drawer: isMobile
          ? Drawer(
              width: 150,
              child: NavigationRail(
                selectedIndex: _selectedIndex,
                groupAlignment: groupAlignment,
                onDestinationSelected: (int index) {},
                extended: true,
                minExtendedWidth: 150,
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite_border),
                    selectedIcon: Icon(Icons.favorite),
                    label: Text('First'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bookmark_border),
                    selectedIcon: Icon(Icons.book),
                    label: Text('Second'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.star_border),
                    selectedIcon: Icon(Icons.star),
                    label: Text('Third'),
                  ),
                ],
              ),
            )
          : null,
      body: Row(
        children: [
          if (!isMobile)
            NavigationRail(
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
              selectedIndex: _selectedIndex,
              groupAlignment: groupAlignment,
              onDestinationSelected: (int index) {},
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
                  selectedIcon: Icon(Icons.favorite),
                  label: Text(
                    'First',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.book),
                  label: Text(
                    'Second',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text(
                    'Third',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
              trailing: Column(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_left_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
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
