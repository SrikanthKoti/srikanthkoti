import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);
  final _key = GlobalKey<ScaffoldState>();
  final _controller = SidebarXController(
    selectedIndex: 0,
    extended: true,
  );

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final isSmallScreen =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;

    return Scaffold(
      key: _key,
      body: Row(
        children: [
          Text(
            "viewModel.user.name",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    // viewModel.initialize();
  }
}

// class _ScreensExample extends ViewModelWidget<HomeViewModel> {
//   const _ScreensExample({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final SidebarXController controller;

//   @override
//   Widget build(BuildContext context, HomeViewModel viewModel) {
//     final theme = Theme.of(context);
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         final pageTitle = viewModel.getTitleByIndex(controller.selectedIndex);
//         switch (controller.selectedIndex) {
//           case 0:
//             return Center(
//               child: Container(
//                 child: Text(viewModel.user.name),
//               ),
//             );
//           default:
//             return Text(
//               pageTitle,
//               style: theme.textTheme.headlineSmall,
//             );
//         }
//       },
//     );
//   }
// }

// case 0:
//   return ListView.builder(
//     padding: const EdgeInsets.only(top: 10),
//     itemBuilder: (context, index) => Container(
//       height: 100,
//       width: double.infinity,
//       margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Theme.of(context).canvasColor,
//         boxShadow: const [BoxShadow()],
//       ),
//       child: Text('data'),
//     ),
//   );
