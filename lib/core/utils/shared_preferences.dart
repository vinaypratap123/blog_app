import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  static late SharedPreferences? _prefs;

  /// Initialize SharedPreferences instance
  static Future init() async => _prefs = await SharedPreferences.getInstance();

  ///keys
  static const String _themeKey = "selected_theme";
  static const String _languageKey = "selected_language";

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

  ///......save app language
  ///set
  static Future setLanguage(String language) async =>
      await _prefs?.setString(_languageKey, language);

  ///get
  static String? getLanguage() => _prefs?.getString(_languageKey);

  ///remove
  static Future removeLanguage() async => await _prefs?.remove(_languageKey);

  /// Clear all data from SharedPreferences
  Future<void> clear() async {
    await _prefs?.clear();
  }
}
