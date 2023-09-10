import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatefulWidget {
  final double size;
  final IconData iconData;

  CustomIcon({this.size = 26, required this.iconData});

  @override
  _CustomIconState createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
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
        child: IconButton(
          onPressed: () => {},
          icon: Icon(
            widget.iconData,
            size: widget.size,
            color: isHovered ? Theme.of(context).primaryColor : null,
          ),
        ));
  }
}
