import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/services/theme_service.dart';
import 'package:srikanthkoti/utils/value_constants.dart';
import 'package:flutter/material.dart';
import 'package:srikanthkoti/app/app.bottomsheets.dart';
import 'package:srikanthkoti/app/app.dialogs.dart';
import 'package:srikanthkoti/app/app.locator.dart';
import 'package:srikanthkoti/app/app.router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy(); // to remove # in url for web
  setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
// flutter build web --web-renderer canvaskit

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
  static final _themeService = locator<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: getDesignSize(context),
        minTextAdapt: true,
        ensureScreenSize: true,
        builder: (context, child) {
          return ValueListenableBuilder<ThemeMode>(
              valueListenable: _themeService.themeModeNotifier,
              builder: (BuildContext context, ThemeMode mode, Widget? child) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Srikanth Koti',
                  theme: _themeService.lightTheme,
                  darkTheme: _themeService.darkTheme,
                  themeMode: mode,
                  routerDelegate: stackedRouter.delegate(),
                  routeInformationParser: stackedRouter.defaultRouteParser(),
                );
              });
        });
  }
}
