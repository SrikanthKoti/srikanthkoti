import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/skills/model/skill_model.dart';
import 'package:srikanthkoti/ui/atoms/custom_svg_icon.dart';

class SkillsIcons extends StatelessWidget {
  final List<Skill> skills;
  const SkillsIcons({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 24.w,
        children: skills.map((skill) {
          return Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: CustomSvgIcon(
              iconPath: skill.iconPath,
              name: skill.name,
            ),
          );
        }).toList());
  }
}
