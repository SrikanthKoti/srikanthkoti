import 'package:srikanthkoti/app/app.bottomsheets.dart';
import 'package:srikanthkoti/app/app.dialogs.dart';
import 'package:srikanthkoti/app/app.locator.dart';
import 'package:srikanthkoti/app/app.logger.dart';
import 'package:srikanthkoti/features/main_layout/main_layout_viewmodel.dart';
import 'package:srikanthkoti/ui/common/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

import '../login/data/user_model.dart';

class HomeViewModel extends MainLayoutViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _log = getLogger('HomeViewModel');

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;
  String text = 'Developer';
  String get testDesktop => 'Hello, STACKED DESKTOP!';
  String get testMobile => 'Hello, STACKED MOBILE!';

  late User user;

  @override
  void initialize() {
    _log.i("started");
  }

  void setText(String newText) {
    text = newText;
    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
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
