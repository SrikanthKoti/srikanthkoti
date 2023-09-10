import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    this.onChanged = _defaultOnChanged,
    required this.label,
    this.controller,
    this.obscureText = false,
  });
  final String? label;
  final void Function(String) onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  static void _defaultOnChanged(String value) {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
