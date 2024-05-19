// import 'package:srikanthkoti/services/shared_preference_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
// import 'package:srikanthkoti/app/app.locator.dart';
// import 'package:stacked_services/stacked_services.dart';

import '../../app/app.logger.dart';

class PortfolioViewModel extends BaseViewModel {
  final _log = getLogger('PortfolioViewModel');
  ScrollController scrollController = ScrollController();

  PageController pageController = PageController(initialPage: 0);
  Future runStartupLogic() async {
    _log.i("started");
  }
}
