import 'package:app_desafio/app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class TextStyleConfig {
  static TextTheme getTextTheme(BuildContext context) {
    return const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 20,
          color: ColorTheme.black,
          fontWeight: FontWeight.normal,
          fontFamilyFallback: ['Helvetica', 'Arial', 'sans-serif']),
      headlineMedium: TextStyle(
          fontSize: 16,
          color: ColorTheme.black,
          fontWeight: FontWeight.w500,
          fontFamilyFallback: ['Helvetica', 'Arial', 'sans-serif']),
      headlineSmall: TextStyle(
          fontSize: 16,
          color: ColorTheme.black,
          fontWeight: FontWeight.w400,
          fontFamilyFallback: ['Helvetica', 'Arial', 'sans-serif']),
    );
  }
}
