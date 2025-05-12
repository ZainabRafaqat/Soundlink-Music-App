import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const themeStatus = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeStatus) ?? false;
  }
}

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;
  static const primaryLightColor = Colors.white;

  static const primaryDarkColor =
      Color.fromRGBO(64, 70, 66, 1.0); // color 404642

  static Color primaryColor =
      const Color.fromRGBO(66, 228, 206, 1.0); // color 42E4CE

  bool get darkTheme => _darkTheme;

  ThemeMode get getCurrentTheme =>
      _darkTheme ? ThemeMode.dark : ThemeMode.light;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  static ThemeData get customLightTheme {
    return ThemeData(
      fontFamily: "Product Sans",
      backgroundColor: Colors.white,
      primaryColor: primaryColor,
      textTheme: const TextTheme(
        headline5: TextStyle(
          letterSpacing: 0.1,
          color: Colors.black,
          fontWeight: FontWeight.w400,
          // height: 0,
        ),

        // settings
        bodyText1: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.8,
        ),

        // appBar subtitle,
        subtitle1: TextStyle(
          color: Colors.black,
          letterSpacing: 0.5,
          // height: 1.7,
        ),

        button: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.6,
        ),
      ),
    );
  }

  static ThemeData get customDarkTheme {
    return ThemeData(
      fontFamily: "Product Sans",
      backgroundColor: const Color.fromRGBO(52, 51, 51, 1.0),
      primaryColor: primaryColor,
      textTheme: const TextTheme(
        headline5: TextStyle(
          letterSpacing: 0.1,
          color: Colors.white,
          fontWeight: FontWeight.w400,
          // height: 0,
        ),

        bodyText1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w200,
          letterSpacing: 0.8,
        ),
        // appBar subtitle,
        subtitle1: TextStyle(
          color: Colors.white,
          letterSpacing: 0.5,
          // height: 1.8,
        ),

        button: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
