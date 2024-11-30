import 'package:blog_app/core/theme/color_constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ///  input border
  static _border([Color color = ColorConstants.borderColor]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  ///.... Dark Mode Theme
  static final darkThemeMode = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorConstants.backgroundDark,
    primaryColor: ColorConstants.primaryColor,

    ///app bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.blackColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorConstants.whiteColor,
        size: 24,
      ),
    ),

    ///cursorColor
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorConstants.greyColor,
    ),

    ///input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(),
      focusedBorder: _border(),
      errorBorder: _border(ColorConstants.errorColor),
      focusedErrorBorder: _border(ColorConstants.errorColor),
      suffixIconColor: ColorConstants.greyColor,
      labelStyle: const TextStyle(
        fontSize: 16,
        color: ColorConstants.greyColor,
      ),
      hintStyle: const TextStyle(
        fontSize: 16,
        color: ColorConstants.greyColor,
      ),
      errorStyle: const TextStyle(
        color: ColorConstants.errorColor,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    ),

    ///text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.normal,
        color: ColorConstants.whiteColor,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: ColorConstants.whiteColor,
      ),
      displaySmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.normal,
        color: ColorConstants.whiteColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: ColorConstants.whiteColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: ColorConstants.whiteColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: ColorConstants.whiteColor,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: ColorConstants.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ColorConstants.whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorConstants.whiteColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: ColorConstants.whiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: ColorConstants.whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: ColorConstants.whiteColor,
      ),
    ),
  );

  ///.... Light Mode Theme
  static final lightThemeMode = ThemeData.dark().copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorConstants.backgroundLight,
    primaryColor: ColorConstants.primaryColor,

    ///appbar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.whiteColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorConstants.blackColor,
        size: 24,
      ),
    ),

    ///cursorColor
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorConstants.greyColor,
    ),

    ///input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(),
      focusedBorder: _border(),
      errorBorder: _border(ColorConstants.errorColor),
      focusedErrorBorder: _border(ColorConstants.errorColor),
      suffixIconColor: ColorConstants.greyColor,
      labelStyle: const TextStyle(
        fontSize: 16,
        color: ColorConstants.greyColor,
      ),
      hintStyle: const TextStyle(
        fontSize: 16,
        color: ColorConstants.greyColor,
      ),
      errorStyle: const TextStyle(
        color: ColorConstants.errorColor,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    ),

    ///text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.normal,
        color: ColorConstants.blackColor,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: ColorConstants.blackColor,
      ),
      displaySmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.normal,
        color: ColorConstants.blackColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: ColorConstants.blackColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: ColorConstants.blackColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: ColorConstants.blackColor,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: ColorConstants.blackColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ColorConstants.blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorConstants.blackColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: ColorConstants.blackColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: ColorConstants.blackColor,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: ColorConstants.blackColor,
      ),
    ),
  );
}
