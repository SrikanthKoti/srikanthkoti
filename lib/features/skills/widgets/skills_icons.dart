import 'package:flutter/material.dart';
import 'package:srikanthkoti/features/skills/model/skill_model.dart';
import 'package:srikanthkoti/ui/atoms/custom_svg_icon.dart';

class SkillsIcons extends StatelessWidget {
  final List<Skill> skills;
  const SkillsIcons({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: skills.map((skill) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomSvgIcon(
          iconPath: skill.iconPath,
          name: skill.name,
        ),
      );
    }).toList());
  }
}
