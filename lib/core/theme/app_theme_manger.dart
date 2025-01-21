import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManger {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundWhite,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundBlack,
  );
}
