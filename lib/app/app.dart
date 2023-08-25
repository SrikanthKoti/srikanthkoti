import 'package:srikanthkoti/features/colleges/colleges_view.dart';
import 'package:srikanthkoti/services/shared_preference_service.dart';
import 'package:srikanthkoti/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:srikanthkoti/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:srikanthkoti/features/home/home_view.dart';
import 'package:srikanthkoti/features/startup/startup_view.dart';
import 'package:srikanthkoti/utils/http_client.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:srikanthkoti/features/login/login_view.dart';
import 'package:srikanthkoti/features/main_layout/main_layout_view.dart';

import '../features/login/service/login_service.dart';
import 'guards/auth_guard.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    CustomRoute(
      page: MainLayoutView,
      path: '/',
      usesPathAsKey: true,
      guards: [AuthGuard],
      children: [
        CustomRoute(
          initial: true,
          path: 'home',
          page: HomeView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          initial: true,
          path: 'colleges',
          page: CollegesView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ],
    ),
    MaterialRoute(page: LoginView),

// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    // @stacked-service
    LazySingleton(classType: BaseHttpClient),
    LazySingleton(classType: LoginService),
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
