// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:stacked/stacked.dart' as _i11;
import 'package:stacked_services/stacked_services.dart' as _i9;

import '../features/blog/blog_view.dart' as _i8;
import '../features/colleges/colleges_view.dart' as _i5;
import '../features/experience/experience_view.dart' as _i6;
import '../features/home/home_view.dart' as _i4;
import '../features/login/login_view.dart' as _i3;
import '../features/main_layout/main_layout_view.dart' as _i2;
import '../features/projects/projects_view.dart' as _i7;
import '../features/startup/startup_view.dart' as _i1;
import 'guards/auth_guard.dart' as _i10;

final stackedRouter = StackedRouterWeb(
  navigatorKey: _i9.StackedService.navigatorKey,
  authGuard: _i10.AuthGuard(),
);

class StackedRouterWeb extends _i11.RootStackRouter {
  StackedRouterWeb({
    _i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i10.AuthGuard authGuard;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
      );
    },
    MainLayoutViewRoute.name: (routeData) {
      final args = routeData.argsAs<MainLayoutViewArgs>(
          orElse: () => const MainLayoutViewArgs());
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.MainLayoutView(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeViewArgs>(orElse: () => const HomeViewArgs());
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.HomeView(key: args.key),
        transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CollegesViewRoute.name: (routeData) {
      final args = routeData.argsAs<CollegesViewArgs>(
          orElse: () => const CollegesViewArgs());
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.CollegesView(key: args.key),
        transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ExperienceViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.ExperienceView(),
        transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProjectsViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.ProjectsView(),
        transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BlogViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.BlogView(),
        transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/',
          usesPathAsKey: true,
          guards: [authGuard],
          children: [
            _i11.RouteConfig(
              '#redirect',
              path: '',
              parent: MainLayoutViewRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i11.RouteConfig(
              HomeViewRoute.name,
              path: 'home',
              parent: MainLayoutViewRoute.name,
            ),
            _i11.RouteConfig(
              CollegesViewRoute.name,
              path: 'colleges',
              parent: MainLayoutViewRoute.name,
            ),
            _i11.RouteConfig(
              ExperienceViewRoute.name,
              path: 'experience',
              parent: MainLayoutViewRoute.name,
            ),
            _i11.RouteConfig(
              ProjectsViewRoute.name,
              path: 'projects',
              parent: MainLayoutViewRoute.name,
            ),
            _i11.RouteConfig(
              BlogViewRoute.name,
              path: 'blog',
              parent: MainLayoutViewRoute.name,
            ),
          ],
        ),
        _i11.RouteConfig(
          LoginViewRoute.name,
          path: '/login-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i11.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.MainLayoutView]
class MainLayoutViewRoute extends _i11.PageRouteInfo<MainLayoutViewArgs> {
  MainLayoutViewRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          MainLayoutViewRoute.name,
          path: '/',
          args: MainLayoutViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainLayoutView';
}

class MainLayoutViewArgs {
  const MainLayoutViewArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'MainLayoutViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.LoginView]
class LoginViewRoute extends _i11.PageRouteInfo<void> {
  const LoginViewRoute()
      : super(
          LoginViewRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginView';
}

/// generated route for
/// [_i4.HomeView]
class HomeViewRoute extends _i11.PageRouteInfo<HomeViewArgs> {
  HomeViewRoute({_i12.Key? key})
      : super(
          HomeViewRoute.name,
          path: 'home',
          args: HomeViewArgs(key: key),
        );

  static const String name = 'HomeView';
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.CollegesView]
class CollegesViewRoute extends _i11.PageRouteInfo<CollegesViewArgs> {
  CollegesViewRoute({_i12.Key? key})
      : super(
          CollegesViewRoute.name,
          path: 'colleges',
          args: CollegesViewArgs(key: key),
        );

  static const String name = 'CollegesView';
}

class CollegesViewArgs {
  const CollegesViewArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'CollegesViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ExperienceView]
class ExperienceViewRoute extends _i11.PageRouteInfo<void> {
  const ExperienceViewRoute()
      : super(
          ExperienceViewRoute.name,
          path: 'experience',
        );

  static const String name = 'ExperienceView';
}

/// generated route for
/// [_i7.ProjectsView]
class ProjectsViewRoute extends _i11.PageRouteInfo<void> {
  const ProjectsViewRoute()
      : super(
          ProjectsViewRoute.name,
          path: 'projects',
        );

  static const String name = 'ProjectsView';
}

/// generated route for
/// [_i8.BlogView]
class BlogViewRoute extends _i11.PageRouteInfo<void> {
  const BlogViewRoute()
      : super(
          BlogViewRoute.name,
          path: 'blog',
        );

  static const String name = 'BlogView';
}

extension RouterStateExtension on _i9.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMainLayoutView({
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      MainLayoutViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLoginView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView({
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      HomeViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCollegesView({
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CollegesViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToExperienceView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ExperienceViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProjectsView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ProjectsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToBlogView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const BlogViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMainLayoutView({
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      MainLayoutViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLoginView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView({
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      HomeViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCollegesView({
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CollegesViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithExperienceView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ExperienceViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProjectsView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ProjectsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithBlogView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const BlogViewRoute(),
      onFailure: onFailure,
    );
  }
}
