import 'package:srikanthkoti/features/about/about_view.dart';
import 'package:srikanthkoti/features/blog/blog_view.dart';
import 'package:srikanthkoti/features/colleges/colleges_view.dart';
import 'package:srikanthkoti/features/portfolio/portfolio_view.dart';
import 'package:srikanthkoti/features/projects/projects_view.dart';
import 'package:srikanthkoti/features/services/services_view.dart';
import 'package:srikanthkoti/features/skills/skills_view.dart';
import 'package:srikanthkoti/services/shared_preference_service.dart';
import 'package:srikanthkoti/services/navrail_service.dart';
import 'package:srikanthkoti/services/theme_service.dart';
import 'package:srikanthkoti/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:srikanthkoti/ui/dialogs/contact_me/contact_me_dialog.dart';
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
import 'package:srikanthkoti/features/experience/experience_view.dart';
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
          path: 'home',
          page: PortfolioView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          initial: true,
          path: 'homeOld',
          page: HomeView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: 'about',
          page: AboutView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: 'skills',
          page: SkillsView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: 'services',
          page: ServicesView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: 'colleges',
          page: CollegesView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: 'experience',
          page: ExperienceView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: 'projects',
          page: ProjectsView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: 'blog',
          page: BlogView,
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
    LazySingleton(classType: NavRailService),
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
    LazySingleton(classType: ThemeService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ContactMeDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
