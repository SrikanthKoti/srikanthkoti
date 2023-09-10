import 'package:srikanthkoti/features/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeMobile extends ViewModelWidget<HomeViewModel> {
  const HomeMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: Row(
        children: [Text('Home Mobile')],
      ),
    );
  }
}
