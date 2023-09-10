import 'package:srikanthkoti/features/about/about_viewmodel.dart';
import 'package:srikanthkoti/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class AboutMobile extends StatelessWidget {
  final AboutViewModel viewModel;

  const AboutMobile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("About View Desktop",
                style: Theme.of(context).textTheme.headlineSmall!
                // .copyWith(fontWeight: FontWeight.bold),
                ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Loading ...',
                    style: Theme.of(context).textTheme.titleSmall!),
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
