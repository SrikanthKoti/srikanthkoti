import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/skills/skill_constants.dart';
import 'package:srikanthkoti/features/skills/skills_viewmodel.dart';
import 'package:srikanthkoti/features/skills/widgets/skills_icons.dart';
import 'package:srikanthkoti/ui/atoms/undraw_svg.dart';
import 'package:srikanthkoti/ui/common/app_spacers.dart';
import 'package:flutter/material.dart';
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
                svgPath: "icons/undraw_developer_activity.svg",
                color: Theme.of(context).primaryColor,
                height: 200.h,
                width: 200.w,
              ),
              height24,
              Text(
                "Skills",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              height24,
              const SkillsIcons(
                skills: skillsList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
