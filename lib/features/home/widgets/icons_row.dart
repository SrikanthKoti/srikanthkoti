import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srikanthkoti/ui/atoms/custom_icon.dart';
import 'package:srikanthkoti/ui/atoms/translate_on_hover.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TranslateOnHover(
          child: CustomIcon(
            iconData: FontAwesomeIcons.github,
            size: isMobile ? 26.w : 56.w,
          ),
        ),
        TranslateOnHover(
          child: CustomIcon(
            iconData: FontAwesomeIcons.linkedinIn,
            size: isMobile ? 26.w : 56.w,
          ),
        ),
        TranslateOnHover(
          child: CustomIcon(
            iconData: FontAwesomeIcons.filePdf,
            size: isMobile ? 26.w : 56.w,
          ),
        ),
      ],
    );
  }
}
