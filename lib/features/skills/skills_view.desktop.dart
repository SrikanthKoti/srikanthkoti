import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/skills/skill_constants.dart';
import 'package:srikanthkoti/features/skills/skills_viewmodel.dart';
import 'package:srikanthkoti/features/skills/widgets/skills_icons.dart';
import 'package:srikanthkoti/ui/atoms/undraw_svg.dart';
import 'package:srikanthkoti/ui/common/app_spacers.dart';
import 'package:flutter/material.dart';
import 'package:srikanthkoti/utils/app_images.dart';
import 'package:stacked/stacked.dart';

class SkillsDesktop extends ViewModelWidget<SkillsViewModel> {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context, SkillsViewModel viewModel) {
    print(kReleaseMode);
    print(AppImages.flutter);
    print(AppImages.portfolioImage);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          controller: viewModel.skillsScrollController,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UnDraw(
                svgPath: AppImages.undrawSkills,
                color: Theme.of(context).primaryColor,
                height: 300.h,
                width: 300.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Skills",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  height24,
                  height24,
                  SizedBox(
                    width: 700.w,
                    child: const SkillsIcons(
                      skills: skillsList,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
