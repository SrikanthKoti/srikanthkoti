import 'package:srikanthkoti/features/main_layout/main_layout_viewmodel.dart';
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

  @override
  Widget build(BuildContext context, MainLayoutViewModel viewModel) {
    return SidebarX(
      controller: _controller,
      theme: sidebarTheme,
      extendedTheme: sidebarExtendedTheme,
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return const SizedBox(
          height: 100,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'HEADER ICON',
                style: TextStyle(fontSize: 30),
              )
              // Image.asset('assets/images/avatar.png'),
              ),
        );
      },
      items: [...items],
    );
  }
}
