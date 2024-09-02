import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: Fonts.regular,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.purple1,
    selectionColor: AppColors.purple1,
    selectionHandleColor: AppColors.purple1,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.pink1, // overscroll indicator color
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  ),
);
