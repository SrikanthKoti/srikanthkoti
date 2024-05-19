import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'projects_viewmodel.dart';

class ProjectsView extends StackedView<ProjectsViewModel> {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProjectsViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        viewModel.handleUserDrag(details, viewModel.serviceScrollController);
      },
      child: Listener(
        onPointerSignal: (PointerSignalEvent event) {
          if (event is PointerScrollEvent) {
            viewModel.handleUserScroll(event, viewModel.serviceScrollController);
          }
        },
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              controller: viewModel.serviceScrollController,
              child: Text(
                "Projects",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
        // ScreenTypeLayout.builder(
        //   mobile: (_) => const ServicesMobile(),
        //   tablet: (_) => const ServicesMobile(),
        //   desktop: (_) => const ServicesDesktop(),
        // ),
      ),
    );
  }

  @override
  ProjectsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProjectsViewModel();
}
