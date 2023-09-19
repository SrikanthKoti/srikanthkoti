import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/skills/skill_constants.dart';
import 'package:srikanthkoti/features/skills/skills_viewmodel.dart';
import 'package:srikanthkoti/features/skills/widgets/icons_row.dart';
import 'package:srikanthkoti/ui/atoms/animated_cursor.dart';
import 'package:srikanthkoti/ui/atoms/undraw_svg.dart';
import 'package:srikanthkoti/ui/common/app_spacers.dart';
import 'package:flutter/material.dart';
import 'package:srikanthkoti/utils/app_images.dart';
import 'package:stacked/stacked.dart';

class SkillsMobile extends ViewModelWidget<SkillsViewModel> {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context, SkillsViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          controller: viewModel.skillsScrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UnDraw(
                svgPath: AppImages.undrawSkills,
                color: Theme.of(context).primaryColor,
                height: 200.h,
                width: 200.w,
              ),
              height24,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Skills",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  AnimatedCursor(
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
              height24,
              const IconsRow(
                icons: skillsList,
              ),
              height24,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Certifications",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  AnimatedCursor(
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
              height24,
              const IconsRow(
                icons: certsList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
