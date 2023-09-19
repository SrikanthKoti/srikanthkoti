import 'package:flutter/material.dart';
import 'package:srikanthkoti/app/app.logger.dart';
import 'package:srikanthkoti/features/main_layout/main_layout_viewmodel.dart';

class SkillsViewModel extends MainLayoutViewModel {
  final _log = getLogger('SkillsViewModel');

  ScrollController skillsScrollController = ScrollController();

  void initialise() {
    _log.i("started");
  }
}
