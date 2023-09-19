import 'package:srikanthkoti/app/app.locator.dart';
import 'package:srikanthkoti/features/main_layout/main_layout_viewmodel.dart';
import 'package:srikanthkoti/services/theme_service.dart';
import 'package:srikanthkoti/ui/common/app_colors.dart';
import 'package:srikanthkoti/ui/common/styles.dart';
import 'package:srikanthkoti/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';

class Sidebar extends ViewModelWidget<MainLayoutViewModel> {
  const Sidebar(
      {Key? key, required SidebarXController controller, required this.items})
      : _controller = controller,
        super(key: key);

  final SidebarXController _controller;
  final List<SidebarXItem> items;
  static final _themeService = locator<ThemeService>().getTheme();

  @override
  Widget build(BuildContext context, MainLayoutViewModel viewModel) {
    // print(_themeService.textTheme.displayLarge!.fontSize);
    return SidebarX(
      controller: _controller,
      // theme: SidebarXTheme(
      //   margin: const EdgeInsets.all(10),
      //   decoration: BoxDecoration(
      //     color: _themeService.navigationRailTheme.backgroundColor,
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   selectedTextStyle:
      //       _themeService.navigationRailTheme.selectedLabelTextStyle,
      //   itemTextPadding: const EdgeInsets.only(left: 30),
      //   selectedItemTextPadding: const EdgeInsets.only(left: 30),
      //   itemDecoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   selectedItemDecoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     color: _themeService.navigationRailTheme.selectedIconTheme!.color,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.28),
      //         blurRadius: 30,
      //       )
      //     ],
      //   ),
      //   iconTheme: IconThemeData(
      //     color: Colors.white.withOpacity(0.7),
      //     size: 20,
      //   ),
      //   selectedIconTheme: const IconThemeData(
      //     color: Colors.white,
      //     size: 20,
      //   ),
      // ),
      extendedTheme: SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
            color: _themeService.navigationRailTheme.backgroundColor),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Srikanth Koti',
                style: _themeService.textTheme.displayLarge,
              )),
        );
      },
      items: [...items],
    );
  }
}
