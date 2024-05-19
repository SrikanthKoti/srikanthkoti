import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srikanthkoti/features/services/services_view.desktop.dart';
import 'package:srikanthkoti/features/services/services_view.mobile.dart';

import 'package:srikanthkoti/features/services/services_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ServicesView extends StackedView<ServicesViewModel> {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ServicesViewModel viewModel,
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
        child: ScreenTypeLayout.builder(
          mobile: (_) => const ServicesMobile(),
          tablet: (_) => const ServicesMobile(),
          desktop: (_) => const ServicesDesktop(),
        ),
      ),
    );
  }

  @override
  ServicesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ServicesViewModel();
  @override
  void onViewModelReady(ServicesViewModel viewModel) {
    viewModel.initialize();
  }
}
