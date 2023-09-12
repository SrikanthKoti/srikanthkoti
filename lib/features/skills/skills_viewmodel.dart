import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:srikanthkoti/app/app.logger.dart';
import 'package:srikanthkoti/features/main_layout/main_layout_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SkillsViewModel extends MainLayoutViewModel {
  final _log = getLogger('AboutViewModel');

  ScrollController skillsScrollController = ScrollController();

  void initialise() {
    _log.i("started");
  }
}
