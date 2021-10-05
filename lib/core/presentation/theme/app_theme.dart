import 'package:flutter/material.dart';

import 'app_colors.dart';

final appTheme = ThemeData.from(
  colorScheme: const ColorScheme.dark().copyWith(
    background: AppColors.dark,
    primary: AppColors.green,
    onPrimary: AppColors.white,
    error: AppColors.red,
    onError: AppColors.white,
  ),
);
