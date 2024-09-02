import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TextE extends StatelessWidget {
  const TextE(
    this.title, {
    super.key,
    required this.fontSize,
    this.color = AppColors.black,
    this.center = false,
  });

  final String title;
  final double fontSize;
  final Color color;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: center ? TextAlign.center : null,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: Fonts.extra,
      ),
    );
  }
}

class TextE2 extends StatelessWidget {
  const TextE2(
    this.title, {
    super.key,
    required this.fontSize,
    this.color = AppColors.black,
    this.center = false,
  });

  final String title;
  final double fontSize;
  final Color color;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: center ? TextAlign.center : null,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: Fonts.extra2,
      ),
    );
  }
}
