import 'package:flutter/gestures.dart';
import 'package:srikanthkoti/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:srikanthkoti/app/app.router.dart';
import 'package:srikanthkoti/features/about/about_view.dart';
import 'package:srikanthkoti/features/home/home_view.dart';
import 'package:srikanthkoti/services/navrail_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:easy_debounce/easy_debounce.dart';
import '../../services/theme_service.dart';

class MainLayoutViewModel extends ReactiveViewModel {
  static final _routerService = locator<RouterService>();
  final themeService = locator<ThemeService>();

  final _navRailService = locator<NavRailService>();
  int get selectedIndex => _navRailService.selectedIndex;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final navigationKey = GlobalKey();
  @override
  List<ListenableServiceMixin> get listenableServices => [_navRailService];
  void onClickNavItem(int index) {
    if (index == selectedIndex) {
      return;
    }
    _navRailService.setSelectedIndex(index);
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

  Map<String, int> pageIndex = {
    '/home': 0,
    '/about': 1,
    '/skills': 2,
    '/projects': 3,
    '/experience': 4,
    '/blog': 5
  };
  void initialize() {
    _navRailService.setSelectedIndex(
        pageIndex[_routerService.router.currentPath] != null
            ? pageIndex[_routerService.router.currentPath]!
            : 0);
  }

  void onTapSidebarItem(String route) {
    _routerService.navigateToPath(path: route);
  }

  int getSelectedIndex() {
    return pageIndex[_routerService.router.currentPath] != null
        ? pageIndex[_routerService.router.currentPath]!
        : 0;
  }

  void toggleThemeMode() {
    print('In here');
    themeService.toggleThemeMode();
  }

  void handleUserScroll(PointerScrollEvent event, ScrollController controller) {
    // Get the current scroll position
    final currentPosition = controller.position.pixels;

    // Get the max scroll extent (the bottom end of the page)
    final maxScrollExtent = controller.position.maxScrollExtent;

    if (event.scrollDelta.dy > 0) {
      // Scrolling down
      if (currentPosition >= maxScrollExtent) {
        print('Reached bottom end');
        if (selectedIndex < 5) {
          EasyDebounce.debounce(
              'user-scroll-down-debouncer',
              Duration(milliseconds: 500),
              () => onClickNavItem(selectedIndex + 1));
        }
      }
    } else if (event.scrollDelta.dy < 0) {
      // Scrolling up
      if (currentPosition <= controller.position.minScrollExtent) {
        print('Reached top end');
        if (selectedIndex > 0) {
          EasyDebounce.debounce(
              'user-scroll-up-debouncer',
              Duration(milliseconds: 500),
              () => onClickNavItem(selectedIndex - 1));
        }
      }
    } else {
      // No scroll
      print('No scroll');
    }
  }

  void handleUserDrag(DragUpdateDetails details, ScrollController controller) {
    // Get the current scroll position
    final currentPosition = controller.position.pixels;

    // Get the max scroll extent (the bottom end of the page)
    final maxScrollExtent = controller.position.maxScrollExtent;

    if (details.delta.dy > 0) {
      // Scrolling down
      if (currentPosition >= maxScrollExtent) {
        print('Reached top end');
        if (selectedIndex > 0) {
          EasyDebounce.debounce(
              'user-scroll-down-debouncer',
              Duration(milliseconds: 500),
              () => onClickNavItem(selectedIndex - 1));
        }
      }
    } else if (details.delta.dy < 0) {
      // Scrolling up
      if (currentPosition <= controller.position.minScrollExtent) {
        print('Reached bottom end');
        if (selectedIndex < 5) {
          EasyDebounce.debounce(
              'user-drag-down-debouncer',
              Duration(milliseconds: 500),
              () => onClickNavItem(selectedIndex + 1));
        }
      }
    } else {
      // No scroll
      print('No scroll');
    }
  }
}
