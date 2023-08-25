import 'package:basement_v2/app/app.bottomsheets.dart';
import 'package:basement_v2/app/app.dialogs.dart';
import 'package:basement_v2/app/app.locator.dart';
import 'package:basement_v2/app/app.router.dart';
import 'package:basement_v2/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/shared_preference_service.dart';
import '../login/data/user_model.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _storageService = locator<SharedPreferencesService>();
  final _routerService = locator<RouterService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  String get testDesktop => 'Hello, STACKED DESKTOP!';
  String get testMobile => 'Hello, STACKED MOBILE!';

  late User user;

  void initialize() {
    user = _storageService.user!;
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  String getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';
      default:
        return 'Not found page';
    }
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
