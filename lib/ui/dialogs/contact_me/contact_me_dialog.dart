import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srikanthkoti/ui/dialogs/contact_me/contact_me.desktop.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'contact_me_dialog_model.dart';

class ContactMeDialog extends StackedView<ContactMeDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ContactMeDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ContactMeDialogModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => ContactMeDesktop(completer: completer, request: request),
      tablet: (_) => ContactMeDesktop(completer: completer, request: request),
      desktop: (_) => ContactMeDesktop(completer: completer, request: request),
    );
  }

  @override
  ContactMeDialogModel viewModelBuilder(BuildContext context) =>
      ContactMeDialogModel();
}
