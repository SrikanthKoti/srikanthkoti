import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      this.onChanged = _defaultOnChanged,
      required this.label,
      this.controller,
      this.obscureText = false,
      this.keyboardType,
      this.maxLines,
      this.hintText,
      this.floatingLabelBehavior,
      this.width = 300});
  final String? label;
  final double width;
  final void Function(String) onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  static void _defaultOnChanged(String value) {}
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? hintText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          alignLabelWithHint: true,
          floatingLabelBehavior: floatingLabelBehavior,
          hintText: hintText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
