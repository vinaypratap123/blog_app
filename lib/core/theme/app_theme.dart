import 'package:blog_app/core/theme/color_constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ///.....  text input border theme
  static _border([Color color = ColorConstants.borderColor]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  ///.............. dark mode theme ..............
  static final darkThemeMode = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorConstants.backgroundDark,
    primaryColor: ColorConstants.primaryColor,

    ///..... app bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.blackColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorConstants.whiteColor,
        size: 24,
      ),
    ),

    ///..... cursor color theme
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorConstants.greyColor,
    ),

    ///..... divider theme
    dividerTheme: const DividerThemeData(
      color: ColorConstants.greyColor,
      thickness: 2.0,
    ),

    ///..... input decoration theme
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

    ///..... snackbar theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ColorConstants.greyColor,
      actionTextColor: ColorConstants.primaryColor,
      behavior: SnackBarBehavior.floating,
      elevation: 6.0,
      showCloseIcon: true,
      contentTextStyle: const TextStyle(
        color: ColorConstants.whiteColor,
        fontSize: 16.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),

    ///..... bottom sheet theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorConstants.blackColor,
      showDragHandle: true,
      dragHandleColor: ColorConstants.greyColor,
      dragHandleSize: Size(60, 3),
      elevation: 6,
      modalElevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    ///..... color scheme theme
    colorScheme: const ColorScheme.dark(
      primary: ColorConstants.primaryColor,
      surface: ColorConstants.blackColor,
      onSurface: ColorConstants.whiteColor,
    ),

    ///..... icon theme
    iconTheme: const IconThemeData(
      color: ColorConstants.whiteColor,
      size: 24.0,
    ),

    ///.....elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: ColorConstants.primaryColor.withOpacity(0.3),
        backgroundColor: ColorConstants.primaryColor,
        shadowColor: ColorConstants.transparentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        elevation: 4,
      ),
    ),

    ///.....text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        color: ColorConstants.whiteColor,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: ColorConstants.whiteColor,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ColorConstants.whiteColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: ColorConstants.whiteColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorConstants.whiteColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
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
        fontWeight: FontWeight.w500,
        color: ColorConstants.whiteColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: ColorConstants.whiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: ColorConstants.whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: ColorConstants.whiteColor,
      ),
    ),
  );

  ///.............. light mode theme ..........................
  static final lightThemeMode = ThemeData.dark().copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorConstants.backgroundLight,
    primaryColor: ColorConstants.primaryColor,

    ///..... appbar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.whiteColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorConstants.blackColor,
        size: 24,
      ),
    ),

    ///..... cursor Color theme
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorConstants.greyColor,
    ),

    ///chip theme
    chipTheme: const ChipThemeData(
      color: WidgetStatePropertyAll<Color>(ColorConstants.whiteColor),
    ),

    ///.....divider theme
    dividerTheme: const DividerThemeData(
      color: ColorConstants.greyColor,
      thickness: 2.0,
    ),

    ///.....input decoration theme
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

    ///..... snackbar theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ColorConstants.greyColor,
      actionTextColor: ColorConstants.primaryColor,
      behavior: SnackBarBehavior.floating,
      elevation: 6.0,
      showCloseIcon: true,
      contentTextStyle: const TextStyle(
        color: ColorConstants.whiteColor,
        fontSize: 16.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),

    ///.....bottom sheet theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorConstants.whiteColor,
      showDragHandle: true,
      dragHandleColor: ColorConstants.greyColor,
      dragHandleSize: Size(60, 3),
      elevation: 6,
      modalElevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    ///..... color scheme theme
    colorScheme: const ColorScheme.dark(
      primary: ColorConstants.primaryColor,
      surface: ColorConstants.whiteColor,
      onSurface: ColorConstants.blackColor,
    ),

    ///..... icon theme
    iconTheme: const IconThemeData(
      color: ColorConstants.blackColor,
      size: 24.0,
    ),

    ///.....elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: ColorConstants.primaryColor.withOpacity(0.3),
        backgroundColor: ColorConstants.primaryColor,
        shadowColor: ColorConstants.transparentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        elevation: 4,
      ),
    ),

    ///.....text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        color: ColorConstants.blackColor,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: ColorConstants.blackColor,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ColorConstants.blackColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: ColorConstants.blackColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorConstants.blackColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
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
        fontWeight: FontWeight.w500,
        color: ColorConstants.blackColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: ColorConstants.blackColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: ColorConstants.blackColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: ColorConstants.blackColor,
      ),
    ),
  );
}
