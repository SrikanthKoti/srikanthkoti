import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'experience_viewmodel.dart';

class ExperienceView extends StackedView<ExperienceViewModel> {
  const ExperienceView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExperienceViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Text(
            "Experience",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ));
  }

  @override
  ExperienceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExperienceViewModel();
}
