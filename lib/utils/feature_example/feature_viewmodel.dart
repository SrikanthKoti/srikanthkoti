import 'package:srikanthkoti/app/app.logger.dart';
import 'package:stacked/stacked.dart';

class FeatureViewModel extends BaseViewModel {
  final _log = getLogger('FeatureViewModel');

  void initialise() {
    _log.i("started");
  }
}
