import 'package:flutter/gestures.dart';
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
                "Experience",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  ExperienceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExperienceViewModel();
}
