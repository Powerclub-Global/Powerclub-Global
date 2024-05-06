import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  dynamic changeTheme(ThemeMode newTheme) {
    themeMode = newTheme;
    notifyListeners();
  }

  bool get isDarkMode => themeMode == ThemeMode.dark ? true : false;
}

ThemeManager themeManager = ThemeManager();
