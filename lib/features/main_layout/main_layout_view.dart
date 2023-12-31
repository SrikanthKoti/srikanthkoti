import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srikanthkoti/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'main_layout_viewmodel.dart';

class MainLayoutView extends StackedView<MainLayoutViewModel> {
  const MainLayoutView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    MainLayoutViewModel viewModel,
    Widget? child,
  ) {
    final isMobile =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;
    final isTablet =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.tablet;

    return Scaffold(
      key: viewModel.scaffoldKey,
      appBar: isMobile
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  viewModel.scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      drawer: isMobile
          ? Drawer(
              width: 100,
              child: NavRail(isTablet: isTablet),
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onClickContactMe();
        },
        child: const Icon(Icons.alternate_email_rounded),
      ),
      body: Row(
        children: [
          if (viewModel.showDailog)
            InfoAlertDialog(
              completer: (p0) {
                print(p0);
              },
              request:
                  DialogRequest(title: 'title', description: 'description'),
            ),
          if (!isMobile) NavRail(isTablet: isTablet),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: const NestedRouter(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  MainLayoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainLayoutViewModel();
  @override
  void onViewModelReady(MainLayoutViewModel viewModel) {
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => viewModel.initialize());
  }

  // void onViewModelReady(AboutViewModel viewModel) {
  //   SchedulerBinding.instance
  //       .addPostFrameCallback((timeStamp) => viewModel.initialise());
  // }
}

class NavRail extends ViewModelWidget<MainLayoutViewModel> {
  const NavRail({
    super.key,
    required this.isTablet,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context, MainLayoutViewModel viewModel) {
    return NavigationRail(
      key: viewModel.navigationKey,
      elevation: 5,
      selectedIndex: viewModel.selectedIndex,
      selectedIconTheme:
          Theme.of(context).navigationRailTheme.selectedIconTheme,
      unselectedIconTheme:
          Theme.of(context).navigationRailTheme.unselectedIconTheme,
      selectedLabelTextStyle: Theme.of(context)
          .navigationRailTheme
          .selectedLabelTextStyle!
          .copyWith(
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          ),
      unselectedLabelTextStyle: Theme.of(context)
          .navigationRailTheme
          .unselectedLabelTextStyle!
          .copyWith(
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          ),
      extended: false, //!isTablet,
      // labelType:
      //     !isTablet ? NavigationRailLabelType.all : NavigationRailLabelType.all,
      minExtendedWidth: 200,
      onDestinationSelected: (int index) {
        viewModel.onClickNavItem(index);
      },
      useIndicator: true,

      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          IconButton(
            icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => RotationTransition(
                      turns: Tween<double>(begin: 0, end: -1).animate(anim),
                      // turns: child.key == ValueKey('icon1')
                      //     ? Tween<double>(begin: 0, end: -1).animate(anim)
                      //     : Tween<double>(begin: 0, end: -1).animate(anim),
                      child: FadeTransition(opacity: anim, child: child),
                    ),
                child: viewModel.themeService.themeModeNotifier.value ==
                        ThemeMode.light
                    ? Icon(
                        Icons.dark_mode,
                        key: const ValueKey('icon1'),
                        size: 32.spMax,
                      )
                    : Icon(Icons.light_mode,
                        key: const ValueKey('icon2'), size: 32.spMax)),
            onPressed: () {
              viewModel.toggleThemeMode();
            },
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Tooltip(
            message: "Home",
            child: Icon(
              FontAwesomeIcons.code,
            ),
          ),
          selectedIcon: Icon(
            FontAwesomeIcons.code,
          ),
          label: Text(
            'Home',
          ),
        ),
        NavigationRailDestination(
          icon: Tooltip(
            preferBelow: false,
            message: 'About',
            child: Icon(
              FontAwesomeIcons.addressCard,
            ),
          ),
          selectedIcon: Icon(
            FontAwesomeIcons.solidAddressCard,
          ),
          label: Text(
            'About',
          ),
        ),
        NavigationRailDestination(
          icon: Tooltip(
            message: 'Skills',
            child: Icon(
              FontAwesomeIcons.star,
            ),
          ),
          selectedIcon: Icon(
            FontAwesomeIcons.solidStar,
          ),
          label: Text(
            'Skills',
          ),
        ),
        NavigationRailDestination(
          icon: Tooltip(
            message: 'Services',
            child: Icon(
              FontAwesomeIcons.wrench,
            ),
          ),
          selectedIcon: Icon(
            FontAwesomeIcons.screwdriverWrench,
          ),
          label: Text(
            'Services',
          ),
        ),
        NavigationRailDestination(
          icon: Tooltip(message: 'Experience', child: Icon(Icons.book)),
          selectedIcon: Icon(Icons.book),
          label: Text(
            'Experience',
          ),
        ),
        NavigationRailDestination(
          icon: Tooltip(
              message: 'Projects', child: Icon(Icons.workspace_premium)),
          selectedIcon: Icon(Icons.star),
          label: Text(
            'Projects',
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.star_border),
          selectedIcon: Icon(Icons.article),
          label: Text(
            'Blog',
          ),
        ),
      ],
    );
  }
}
