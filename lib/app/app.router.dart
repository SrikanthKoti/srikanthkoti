// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i14;
import 'package:stacked/stacked.dart' as _i13;
import 'package:stacked_services/stacked_services.dart' as _i11;

import '../features/about/about_view.dart' as _i5;
import '../features/blog/blog_view.dart' as _i10;
import '../features/colleges/colleges_view.dart' as _i7;
import '../features/experience/experience_view.dart' as _i8;
import '../features/home/home_view.dart' as _i4;
import '../features/login/login_view.dart' as _i3;
import '../features/main_layout/main_layout_view.dart' as _i2;
import '../features/projects/projects_view.dart' as _i9;
import '../features/skills/skills_view.dart' as _i6;
import '../features/startup/startup_view.dart' as _i1;
import 'guards/auth_guard.dart' as _i12;

final stackedRouter = StackedRouterWeb(
  navigatorKey: _i11.StackedService.navigatorKey,
  authGuard: _i12.AuthGuard(),
);

class StackedRouterWeb extends _i13.RootStackRouter {
  StackedRouterWeb({
    _i14.GlobalKey<_i14.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i12.AuthGuard authGuard;

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
      );
    },
    MainLayoutViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.MainLayoutView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginViewRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
        transitionsBuilder: _i13.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AboutViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.AboutView(),
        transitionsBuilder: _i13.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SkillsViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.SkillsView(),
        transitionsBuilder: _i13.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CollegesViewRoute.name: (routeData) {
      final args = routeData.argsAs<CollegesViewArgs>(
          orElse: () => const CollegesViewArgs());
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.CollegesView(key: args.key),
        transitionsBuilder: _i13.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ExperienceViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.ExperienceView(),
        transitionsBuilder: _i13.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProjectsViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.ProjectsView(),
        transitionsBuilder: _i13.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BlogViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.BlogView(),
        transitionsBuilder: _i13.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i13.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/',
          usesPathAsKey: true,
          guards: [authGuard],
          children: [
            _i13.RouteConfig(
              '#redirect',
              path: '',
              parent: MainLayoutViewRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i13.RouteConfig(
              HomeViewRoute.name,
              path: 'home',
              parent: MainLayoutViewRoute.name,
            ),
            _i13.RouteConfig(
              AboutViewRoute.name,
              path: 'about',
              parent: MainLayoutViewRoute.name,
            ),
            _i13.RouteConfig(
              SkillsViewRoute.name,
              path: 'skills',
              parent: MainLayoutViewRoute.name,
            ),
            _i13.RouteConfig(
              CollegesViewRoute.name,
              path: 'colleges',
              parent: MainLayoutViewRoute.name,
            ),
            _i13.RouteConfig(
              ExperienceViewRoute.name,
              path: 'experience',
              parent: MainLayoutViewRoute.name,
            ),
            _i13.RouteConfig(
              ProjectsViewRoute.name,
              path: 'projects',
              parent: MainLayoutViewRoute.name,
            ),
            _i13.RouteConfig(
              BlogViewRoute.name,
              path: 'blog',
              parent: MainLayoutViewRoute.name,
            ),
          ],
        ),
        _i13.RouteConfig(
          LoginViewRoute.name,
          path: '/login-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i13.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.MainLayoutView]
class MainLayoutViewRoute extends _i13.PageRouteInfo<void> {
  const MainLayoutViewRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainLayoutViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainLayoutView';
}

/// generated route for
/// [_i3.LoginView]
class LoginViewRoute extends _i13.PageRouteInfo<void> {
  const LoginViewRoute()
      : super(
          LoginViewRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginView';
}

/// generated route for
/// [_i4.HomeView]
class HomeViewRoute extends _i13.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: 'home',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i5.AboutView]
class AboutViewRoute extends _i13.PageRouteInfo<void> {
  const AboutViewRoute()
      : super(
          AboutViewRoute.name,
          path: 'about',
        );

  static const String name = 'AboutView';
}

/// generated route for
/// [_i6.SkillsView]
class SkillsViewRoute extends _i13.PageRouteInfo<void> {
  const SkillsViewRoute()
      : super(
          SkillsViewRoute.name,
          path: 'skills',
        );

  static const String name = 'SkillsView';
}

/// generated route for
/// [_i7.CollegesView]
class CollegesViewRoute extends _i13.PageRouteInfo<CollegesViewArgs> {
  CollegesViewRoute({_i14.Key? key})
      : super(
          CollegesViewRoute.name,
          path: 'colleges',
          args: CollegesViewArgs(key: key),
        );

  static const String name = 'CollegesView';
}

class CollegesViewArgs {
  const CollegesViewArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'CollegesViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ExperienceView]
class ExperienceViewRoute extends _i13.PageRouteInfo<void> {
  const ExperienceViewRoute()
      : super(
          ExperienceViewRoute.name,
          path: 'experience',
        );

  static const String name = 'ExperienceView';
}

/// generated route for
/// [_i9.ProjectsView]
class ProjectsViewRoute extends _i13.PageRouteInfo<void> {
  const ProjectsViewRoute()
      : super(
          ProjectsViewRoute.name,
          path: 'projects',
        );

  static const String name = 'ProjectsView';
}

/// generated route for
/// [_i10.BlogView]
class BlogViewRoute extends _i13.PageRouteInfo<void> {
  const BlogViewRoute()
      : super(
          BlogViewRoute.name,
          path: 'blog',
        );

  static const String name = 'BlogView';
}

extension RouterStateExtension on _i11.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMainLayoutView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLoginView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAboutView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AboutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSkillsView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SkillsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCollegesView({
    _i14.Key? key,
    void Function(_i13.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CollegesViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToExperienceView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ExperienceViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProjectsView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ProjectsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToBlogView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const BlogViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMainLayoutView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLoginView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAboutView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AboutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSkillsView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SkillsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCollegesView({
    _i14.Key? key,
    void Function(_i13.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CollegesViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithExperienceView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ExperienceViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProjectsView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ProjectsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithBlogView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const BlogViewRoute(),
      onFailure: onFailure,
    );
  }
}
