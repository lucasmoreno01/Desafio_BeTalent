import 'package:app_desafio/app/theme/color_theme.dart';
import 'package:app_desafio/app/theme/text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final AppTheme instance = AppTheme._();
  AppTheme._();

  ThemeData appTheme(BuildContext context) {
    final textTheme = TextStyleConfig.getTextTheme(context);

    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      primaryColor: ColorTheme.primary,
    );
  }
}
