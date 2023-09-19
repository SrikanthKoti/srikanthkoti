import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/skills/model/skill_model.dart';
import 'package:srikanthkoti/ui/atoms/custom_svg_icon.dart';

class IconsRow extends StatelessWidget {
  final List<IconEntity> icons;
  const IconsRow({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 24.w,
        children: icons.map((icon) {
          return Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: CustomSvgIcon(
              iconPath: icon.path,
              name: icon.name,
              height: icon.height,
              width: icon.width,
            ),
          );
        }).toList());
  }
}
