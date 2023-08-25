import 'package:basement_v2/services/shared_preference_service.dart';
import 'package:stacked/stacked.dart';
import 'package:basement_v2/app/app.locator.dart';
import 'package:basement_v2/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.logger.dart';
import '../login/data/user_model.dart';

class StartupViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _storageService = locator<SharedPreferencesService>();
  final text = "STARTUPMOBILE";
  final textDesktop = "STARTUP DESKTOP";
  final _log = getLogger('StartupViewModel');

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    User? user = _storageService.user;
    _log.i(user);

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    // _routerService.navigateToPath(path: 'admin/home');
    // await _routerService.clearStackAndShow(MainLayoutViewRoute());
    // _routerService.replaceWithMainLayoutView();

    if (user != null) {
      _routerService.clearStackAndShow(MainLayoutViewRoute());
    }
    _routerService.replaceWithLoginView();
  }
}
