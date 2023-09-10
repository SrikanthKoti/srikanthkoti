import 'package:srikanthkoti/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:srikanthkoti/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/theme_service.dart';

class MainLayoutViewModel extends BaseViewModel {
  static final _routerService = locator<RouterService>();
  final themeService = locator<ThemeService>();
  final GlobalKey navigationKey = GlobalKey();
  int selectedIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void onClickNavItem(int index) {
    if (index == selectedIndex) {
      return;
    }
    selectedIndex = index;
    if (index == 0) {
      _routerService.navigateToHomeView();
    } else if (index == 1) {
      _routerService.navigateToAboutView();
    } else if (index == 2) {
      _routerService.navigateToSkillsView();
    } else if (index == 3) {
      _routerService.navigateToProjectsView();
    } else if (index == 4) {
      _routerService.navigateToExperienceView();
    } else if (index == 5) {
      _routerService.navigateToBlogView();
    }
    scaffoldKey.currentState?.closeDrawer();
  }

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
  Map<String, int> pageIndex = {
    '/home': 0,
    '/about': 1,
    '/skills': 2,
    '/projects': 3,
    '/experience': 4,
    '/blog': 5
  };
  void initialize() {
    sidebarItems = defaultSideBar["items"];
    selectedIndex = pageIndex[_routerService.router.currentPath] != null
        ? pageIndex[_routerService.router.currentPath]!
        : 0;
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
}
