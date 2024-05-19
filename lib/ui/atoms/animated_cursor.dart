import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedCursor extends StatelessWidget {
  TextStyle style;
  AnimatedCursor({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          '',
          cursor: '_',
          speed: const Duration(milliseconds: 100),
          textStyle: style,
        ),
      ],
      repeatForever: true,
    );
  }
}
