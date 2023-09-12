import 'package:stacked/stacked.dart';

class NavRailService with ListenableServiceMixin {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
