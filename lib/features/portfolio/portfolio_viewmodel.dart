// import 'package:srikanthkoti/services/shared_preference_service.dart';
import 'package:stacked/stacked.dart';
// import 'package:srikanthkoti/app/app.locator.dart';
// import 'package:stacked_services/stacked_services.dart';

import '../../app/app.logger.dart';

class PortfolioViewModel extends BaseViewModel {
  // final _routerService = locator<RouterService>();
  // final _storageService = locator<SharedPreferencesService>();
  final text = "STARTUPMOBILE";
  final textDesktop = "STARTUP DESKTOP";
  final _log = getLogger('PortfolioViewModel');

  Future runStartupLogic() async {
    _log.i("started");
  }
}
