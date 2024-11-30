import 'package:blog_app/core/constants/app_constants.dart';
import 'package:blog_app/core/theme/app_theme.dart';
import 'package:blog_app/core/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final SharedPreferencesHandler _prefsHandler = SharedPreferencesHandler();

  ThemeCubit() : super(AppTheme.lightThemeMode) {
    _loadTheme();
  }

  ThemeModeEnum _currentTheme = ThemeModeEnum.light;

  ///toggle theme
  void toggleTheme(ThemeModeEnum themeMode) async {
    _currentTheme = themeMode;
    if (themeMode == ThemeModeEnum.dark) {
      emit(AppTheme.darkThemeMode);
      _prefsHandler.setTheme(themeMode.toString());
    } else {
      emit(AppTheme.lightThemeMode);
      _prefsHandler.setTheme(themeMode.toString());
    }
  }

  ThemeModeEnum getCurrentTheme() {
    return _currentTheme;
  }

  ///load set theme
  Future<void> _loadTheme() async {
    final themeString =
        // _prefsHandler.getTheme() ?? ThemeModeEnum.dark.toString();
        _prefsHandler.getTheme() ?? ThemeModeEnum.light.toString();
    final themeMode = ThemeModeEnum.values.firstWhere(
      (mode) => mode.toString() == themeString,
    );
    _currentTheme = themeMode;
    toggleTheme(themeMode);
  }

  ///clear theme
  Future<void> clearTheme() async {
    await _prefsHandler.removeTheme();
    _currentTheme = ThemeModeEnum.light;
    emit(AppTheme.lightThemeMode);
  }
}