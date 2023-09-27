import 'package:flutter/material.dart';
import 'package:srikanthkoti/app/app.logger.dart';
import 'package:srikanthkoti/features/main_layout/main_layout_viewmodel.dart';
import 'package:srikanthkoti/utils/app_images.dart';

class ServicesViewModel extends MainLayoutViewModel {
  final ScrollController serviceScrollController = ScrollController();
  final _log = getLogger('ServicesViewModel');
  String getServiceImage(int index) {
    switch (index) {
      case 0:
        serviceIcon = AppImages.undrawWeb;
        break;
      case 1:
        serviceIcon = AppImages.undrawWeb;
        break;
      case 2:
        serviceIcon = AppImages.undrawWeb;
        break;
    }
    return AppImages.undrawWeb;
  }

  String serviceIcon = AppImages.undrawWeb;
  @override
  void initialize() {
    _log.i("started");
  }

  void setServiceIcon(int value) {
    if (value == 0) {
      serviceIcon = AppImages.undrawWeb;
    } else if (value == 1) {
      serviceIcon = AppImages.undrawMobile;
    } else if (value == 2) {
      serviceIcon = AppImages.undrawIot;
    } else if (value == 3) {
      serviceIcon = AppImages.undrawWeb;
    }
    notifyListeners();
  }
}
