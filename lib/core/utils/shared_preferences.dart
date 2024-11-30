import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  static SharedPreferences? _prefs;
  static final SharedPreferencesHandler _instance =
      SharedPreferencesHandler._internal();

  factory SharedPreferencesHandler() {
    return _instance;
  }

  SharedPreferencesHandler._internal();

  /// Initialize SharedPreferences instance
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  ///keys
  static const String _themeKey = "selected_theme";

  ///.......save app theme pref
  // set theme
  Future<void> setTheme(String themeMode) async {
    await _prefs?.setString(_themeKey, themeMode);
  }

  // get theme
  String? getTheme() {
    return _prefs?.getString(_themeKey);
  }

  // remove theme
  Future<void> removeTheme() async {
    await _prefs?.remove(_themeKey);
  }

  // Clear all data from SharedPreferences
  Future<void> clear() async {
    await _prefs?.clear();
  }
}
