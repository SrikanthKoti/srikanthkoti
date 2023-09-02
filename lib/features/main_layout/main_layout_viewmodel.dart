import 'package:srikanthkoti/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/theme_service.dart';

class MainLayoutViewModel extends BaseViewModel {
  static final _routerService = locator<RouterService>();
  final controller = SidebarXController(selectedIndex: 0, extended: true);
  final themeService = locator<ThemeService>();

  final Map<String, dynamic> superAdminSideBar = {
    "items": <SidebarXItem>[
      SidebarXItem(
        icon: Icons.home,
        label: 'Home',
        onTap: () {
          _routerService.navigateToPath(path: 'home');
        },
      ),
      SidebarXItem(
        icon: Icons.home,
        label: 'Colleges',
        onTap: () {
          _routerService.navigateToPath(path: 'colleges');
        },
      ),
    ],
    "home": 0,
    "colleges": 1,
  };
  final Map<String, dynamic> defaultSideBar = {
    "items": <SidebarXItem>[
      SidebarXItem(
        icon: Icons.home,
        label: 'Home',
        onTap: () {
          _routerService.navigateToPath(path: 'home');
        },
      ),
      SidebarXItem(
        icon: Icons.article,
        label: 'Blogs',
        onTap: () {
          // _routerService.navigateToPath(path: 'home');
        },
      ),
    ],
    "home": 0,
    "blogs": 1
  };

  late List<SidebarXItem> sidebarItems;
  void initialize() {
    sidebarItems = defaultSideBar["items"];
  }

  String getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';
      default:
        return 'Not found page';
    }
  }

  void onTapSidebarItem(String route) {
    _routerService.navigateToPath(path: route);
  }

  void toggleThemeMode() {
    print('In here');
    themeService.toggleThemeMode();
  }
  // List<SidebarXItem> getSideBarItems(List<String>? roleList) {
  //   if (roleList != null && roleList.contains('Super Admin')) {
  //     return superAdminSideBar["items"];
  //   }
  //   return defaultSideBar["items"];
  // }
}
