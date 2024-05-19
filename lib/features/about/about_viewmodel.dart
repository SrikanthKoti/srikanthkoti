import 'package:flutter/material.dart';
import 'package:srikanthkoti/app/app.logger.dart';
import 'package:srikanthkoti/features/main_layout/main_layout_viewmodel.dart';

class AboutViewModel extends MainLayoutViewModel {
  final ScrollController aboutScrollController = ScrollController();

  final _log = getLogger('AboutViewModel');
  String text = 'Developer';
  void setText(String newText) {
    text = newText;
    notifyListeners();
  }

  void initialise() {
    _log.i("started");
    notifyListeners();
  }
}
