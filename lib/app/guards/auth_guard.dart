import 'package:basement_v2/app/app.router.dart';
import 'package:basement_v2/services/shared_preference_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app.locator.dart';

class AuthGuard extends StackedRouteGuard {
  @override
  Future<void> onNavigation(resolver, router) async {
    final _storageService = locator<SharedPreferencesService>();
    final _routerService = locator<RouterService>();
    if (_storageService.user == null) {
      _routerService.clearStackAndShow(const LoginViewRoute());
      return;
    }

    resolver.next(true);
  }
}
