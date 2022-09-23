
// Main purpose of this provider is to keep listening
import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/services/dark_theme_prefs.dart';

// ChangeNotifier will always keep listening to changes
class DarkThemeProvider with ChangeNotifier{

  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme (bool value){
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners(); // notifyListener will tell the ChangeNotifier that something is changed

  }
}