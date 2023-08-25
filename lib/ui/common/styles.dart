import 'package:basement_v2/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

SidebarXTheme sidebarTheme = SidebarXTheme(
  margin: const EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: canvasColor,
    borderRadius: BorderRadius.circular(20),
  ),
  hoverColor: scaffoldBackgroundColor,
  textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
  selectedTextStyle: const TextStyle(color: Colors.white),
  itemTextPadding: const EdgeInsets.only(left: 30),
  selectedItemTextPadding: const EdgeInsets.only(left: 30),
  itemDecoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: canvasColor),
  ),
  selectedItemDecoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: actionColor.withOpacity(0.37),
    ),
    gradient: const LinearGradient(
      colors: [accentCanvasColor, canvasColor],
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.28),
        blurRadius: 30,
      )
    ],
  ),
  iconTheme: IconThemeData(
    color: Colors.white.withOpacity(0.7),
    size: 20,
  ),
  selectedIconTheme: const IconThemeData(
    color: Colors.white,
    size: 20,
  ),
);

const SidebarXTheme sidebarExtendedTheme = SidebarXTheme(
  width: 200,
  decoration: BoxDecoration(
    color: canvasColor,
  ),
);
