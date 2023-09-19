import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srikanthkoti/ui/atoms/translate_on_hover.dart';

class CustomSvgIcon extends StatefulWidget {
  final double? height;
  final double? width;
  final String iconPath;
  final String name;
  final bool showColorFilter;

  const CustomSvgIcon({
    super.key,
    this.height = 48,
    this.width = 48,
    this.showColorFilter = true,
    required this.iconPath,
    required this.name,
  });

  @override
  _CustomSvgIconState createState() => _CustomSvgIconState();
}

class _CustomSvgIconState extends State<CustomSvgIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Tooltip(
        message: widget.name,
        child: TranslateOnHover(
          child: SvgPicture.asset(
            widget.iconPath,
            colorFilter: widget.showColorFilter
                ? ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.srcIn)
                : null,
            height: widget.height == null ? 48.h : widget.height!.h,
            width: widget.width == null ? 48.w : widget.width!.w,
          ),
        ),
      ),
    );
  }
}
