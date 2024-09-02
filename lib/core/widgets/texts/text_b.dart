import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TextB extends StatelessWidget {
  const TextB(
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
        fontFamily: Fonts.bold,
      ),
    );
  }
}

class TextB2 extends StatelessWidget {
  const TextB2(
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
        fontFamily: Fonts.bold2,
      ),
    );
  }
}
