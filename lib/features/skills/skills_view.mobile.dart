import 'package:srikanthkoti/features/skills/skills_viewmodel.dart';
import 'package:srikanthkoti/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SkillsMobile extends ViewModelWidget<SkillsViewModel> {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context, SkillsViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Skills View Desktop",
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
