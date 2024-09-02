import 'package:flutter/material.dart';

class AppColors {
  static const Color bg = Color(0xffF1EAFD);
  static const Color text1 = Color(0xff464646);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff150F1B);
  static const Color grey1 = Color(0xff665E6D);
  static const Color pink1 = Color(0xffD1B7FF);
  static const Color pink2 = Color(0xffFECBFF);
  static const Color purple1 = Color(0xff6130B6);
  static const Color purple2 = Color(0xff7B44DC);
  static const Color green = Color(0xffB8F9AE);
  static const Color textField = Color(0xffE3D2FF);
  static Color white50 = white.withOpacity(0.5);
}

class Fonts {
  static const String regular = 'Inter';
  static const String medium = 'InterM';
  static const String bold = 'InterB';
  static const String extra = 'InterBB';
  static const String regular2 = 'Montserrat';
  static const String medium2 = 'MontserratM';
  static const String bold2 = 'MontserratB';
  static const String extra2 = 'MontserratBB';
}

Color getCategoryColor(String category) {
  if (category == 'Sugar') return AppColors.pink2;
  if (category == 'Coffee Cups') return AppColors.green;
  if (category == 'Desserts') return AppColors.purple2;
  if (category == 'Coffee') return const Color(0xffA2B3FF);
  if (category == 'Syrup for Coffee') return const Color(0xffFB41FF);
  return AppColors.pink2;
}

List<Color> pieChartColors = [
  AppColors.pink2, // sugar
  AppColors.green, // coffee cups
  const Color(0xffA2B3FF), // coffee
  const Color(0xff7B44DC), // dessert
  const Color(0xffFB41FF), // syrup for coffee
];
