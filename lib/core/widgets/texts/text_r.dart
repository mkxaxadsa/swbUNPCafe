import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TextR extends StatelessWidget {
  const TextR(
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
        fontFamily: Fonts.regular,
      ),
    );
  }
}

class TextR2 extends StatelessWidget {
  const TextR2(
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
        fontFamily: Fonts.regular2,
      ),
    );
  }
}
