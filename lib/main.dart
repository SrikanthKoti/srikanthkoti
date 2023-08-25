import 'package:srikanthkoti/utils/screen_utils.dart';
import 'package:srikanthkoti/utils/value_constants.dart';
import 'package:flutter/material.dart';
import 'package:srikanthkoti/app/app.bottomsheets.dart';
import 'package:srikanthkoti/app/app.dialogs.dart';
import 'package:srikanthkoti/app/app.locator.dart';
import 'package:srikanthkoti/app/app.router.dart';
import 'package:srikanthkoti/ui/common/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy(); // to remove # in url for web
  setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

Size getDesignSize(context) {
  var deviceType = getDeviceType(MediaQuery.of(context).size);
  switch (deviceType) {
    case DeviceScreenType.mobile:
      return const Size(design_mobile_width, design_mobile_height);
    default:
      return const Size(design_desktop_width, design_desktop_height);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: getDesignSize(context),
        allowFontScaling: false,
        builder: () {
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: Theme.of(context).copyWith(
              primaryColor: kcBackgroundColor,
              focusColor: kcPrimaryColor,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.black,
                  ),
            ),
            routerDelegate: stackedRouter.delegate(),
            routeInformationParser: stackedRouter.defaultRouteParser(),
          );
        });
  }
}
