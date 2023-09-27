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
    return Scaffold(
      body: Center(
        child: Text(
          "Projects",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }

  @override
  ProjectsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProjectsViewModel();
}
