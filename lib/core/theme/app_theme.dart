import 'package:blog_app/core/theme/color_constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorConstants.backgroundColor,
  );
  static final lightThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorConstants.whiteColor,
  );
}
