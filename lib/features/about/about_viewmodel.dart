import 'package:srikanthkoti/app/app.logger.dart';
import 'package:stacked/stacked.dart';

class AboutViewModel extends BaseViewModel {
  final _log = getLogger('AboutViewModel');

  void initialise() {
    _log.i("started");
  }
}
