import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  final double size;
  final IconData iconData;

  const CustomIcon({super.key, this.size = 26, required this.iconData});

  @override
  _CustomIconState createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: MouseRegion(
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
        ),
      ),
      feedback: Icon(
        widget.iconData,
        size: widget.size,
        color: Theme.of(context).primaryColor,
      ),
      childWhenDragging: Container(), // You can customize this to your needs.
    );
  }
}
