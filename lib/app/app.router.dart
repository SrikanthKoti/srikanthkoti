// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i16;
import 'package:stacked/stacked.dart' as _i15;
import 'package:stacked_services/stacked_services.dart' as _i13;

import '../features/about/about_view.dart' as _i6;
import '../features/blog/blog_view.dart' as _i12;
import '../features/colleges/colleges_view.dart' as _i9;
import '../features/experience/experience_view.dart' as _i10;
import '../features/home/home_view.dart' as _i5;
import '../features/login/login_view.dart' as _i3;
import '../features/main_layout/main_layout_view.dart' as _i2;
import '../features/portfolio/portfolio_view.dart' as _i4;
import '../features/projects/projects_view.dart' as _i11;
import '../features/services/services_view.dart' as _i8;
import '../features/skills/skills_view.dart' as _i7;
import '../features/startup/startup_view.dart' as _i1;
import 'guards/auth_guard.dart' as _i14;

final stackedRouter = StackedRouterWeb(
  navigatorKey: _i13.StackedService.navigatorKey,
  authGuard: _i14.AuthGuard(),
);

class StackedRouterWeb extends _i15.RootStackRouter {
  StackedRouterWeb({
    _i16.GlobalKey<_i16.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i14.AuthGuard authGuard;

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
      );
    },
    MainLayoutViewRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.MainLayoutView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginViewRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
      );
    },
    PortfolioViewRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.PortfolioView(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AboutViewRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.AboutView(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SkillsViewRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.SkillsView(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServicesViewRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.ServicesView(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CollegesViewRoute.name: (routeData) {
      final args = routeData.argsAs<CollegesViewArgs>(
          orElse: () => const CollegesViewArgs());
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: _i9.CollegesView(key: args.key),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ExperienceViewRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.ExperienceView(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProjectsViewRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.ProjectsView(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BlogViewRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.BlogView(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i15.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/',
          usesPathAsKey: true,
          guards: [authGuard],
          children: [
            _i15.RouteConfig(
              '#redirect',
              path: '',
              parent: MainLayoutViewRoute.name,
              redirectTo: 'homeOld',
              fullMatch: true,
            ),
            _i15.RouteConfig(
              PortfolioViewRoute.name,
              path: 'home',
              parent: MainLayoutViewRoute.name,
            ),
            _i15.RouteConfig(
              HomeViewRoute.name,
              path: 'homeOld',
              parent: MainLayoutViewRoute.name,
            ),
            _i15.RouteConfig(
              AboutViewRoute.name,
              path: 'about',
              parent: MainLayoutViewRoute.name,
            ),
            _i15.RouteConfig(
              SkillsViewRoute.name,
              path: 'skills',
              parent: MainLayoutViewRoute.name,
            ),
            _i15.RouteConfig(
              ServicesViewRoute.name,
              path: 'services',
              parent: MainLayoutViewRoute.name,
            ),
            _i15.RouteConfig(
              CollegesViewRoute.name,
              path: 'colleges',
              parent: MainLayoutViewRoute.name,
            ),
            _i15.RouteConfig(
              ExperienceViewRoute.name,
              path: 'experience',
              parent: MainLayoutViewRoute.name,
            ),
            _i15.RouteConfig(
              ProjectsViewRoute.name,
              path: 'projects',
              parent: MainLayoutViewRoute.name,
            ),
            _i15.RouteConfig(
              BlogViewRoute.name,
              path: 'blog',
              parent: MainLayoutViewRoute.name,
            ),
          ],
        ),
        _i15.RouteConfig(
          LoginViewRoute.name,
          path: '/login-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i15.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.MainLayoutView]
class MainLayoutViewRoute extends _i15.PageRouteInfo<void> {
  const MainLayoutViewRoute({List<_i15.PageRouteInfo>? children})
      : super(
          MainLayoutViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainLayoutView';
}

/// generated route for
/// [_i3.LoginView]
class LoginViewRoute extends _i15.PageRouteInfo<void> {
  const LoginViewRoute()
      : super(
          LoginViewRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginView';
}

/// generated route for
/// [_i4.PortfolioView]
class PortfolioViewRoute extends _i15.PageRouteInfo<void> {
  const PortfolioViewRoute()
      : super(
          PortfolioViewRoute.name,
          path: 'home',
        );

  static const String name = 'PortfolioView';
}

/// generated route for
/// [_i5.HomeView]
class HomeViewRoute extends _i15.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: 'homeOld',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i6.AboutView]
class AboutViewRoute extends _i15.PageRouteInfo<void> {
  const AboutViewRoute()
      : super(
          AboutViewRoute.name,
          path: 'about',
        );

  static const String name = 'AboutView';
}

/// generated route for
/// [_i7.SkillsView]
class SkillsViewRoute extends _i15.PageRouteInfo<void> {
  const SkillsViewRoute()
      : super(
          SkillsViewRoute.name,
          path: 'skills',
        );

  static const String name = 'SkillsView';
}

/// generated route for
/// [_i8.ServicesView]
class ServicesViewRoute extends _i15.PageRouteInfo<void> {
  const ServicesViewRoute()
      : super(
          ServicesViewRoute.name,
          path: 'services',
        );

  static const String name = 'ServicesView';
}

/// generated route for
/// [_i9.CollegesView]
class CollegesViewRoute extends _i15.PageRouteInfo<CollegesViewArgs> {
  CollegesViewRoute({_i16.Key? key})
      : super(
          CollegesViewRoute.name,
          path: 'colleges',
          args: CollegesViewArgs(key: key),
        );

  static const String name = 'CollegesView';
}

class CollegesViewArgs {
  const CollegesViewArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'CollegesViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.ExperienceView]
class ExperienceViewRoute extends _i15.PageRouteInfo<void> {
  const ExperienceViewRoute()
      : super(
          ExperienceViewRoute.name,
          path: 'experience',
        );

  static const String name = 'ExperienceView';
}

/// generated route for
/// [_i11.ProjectsView]
class ProjectsViewRoute extends _i15.PageRouteInfo<void> {
  const ProjectsViewRoute()
      : super(
          ProjectsViewRoute.name,
          path: 'projects',
        );

  static const String name = 'ProjectsView';
}

/// generated route for
/// [_i12.BlogView]
class BlogViewRoute extends _i15.PageRouteInfo<void> {
  const BlogViewRoute()
      : super(
          BlogViewRoute.name,
          path: 'blog',
        );

  static const String name = 'BlogView';
}

extension RouterStateExtension on _i13.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMainLayoutView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLoginView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToPortfolioView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const PortfolioViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAboutView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AboutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSkillsView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SkillsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToServicesView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ServicesViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCollegesView({
    _i16.Key? key,
    void Function(_i15.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CollegesViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToExperienceView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ExperienceViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProjectsView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ProjectsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToBlogView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const BlogViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMainLayoutView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLoginView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithPortfolioView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const PortfolioViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAboutView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AboutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSkillsView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SkillsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithServicesView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ServicesViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCollegesView({
    _i16.Key? key,
    void Function(_i15.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CollegesViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithExperienceView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ExperienceViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProjectsView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ProjectsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithBlogView(
      {void Function(_i15.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const BlogViewRoute(),
      onFailure: onFailure,
    );
  }
}
