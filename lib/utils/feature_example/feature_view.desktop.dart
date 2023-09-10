import 'package:srikanthkoti/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:srikanthkoti/utils/feature_example/feature_viewmodel.dart';

class FeatureDesktop extends StatelessWidget {
  final FeatureViewModel viewModel;
  const FeatureDesktop({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Feature View Desktop",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Loading ...',
                    style: Theme.of(context).textTheme.titleLarge!),
                horizontalSpaceSmall,
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
