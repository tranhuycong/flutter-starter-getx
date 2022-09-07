import 'package:flutter/material.dart';

class AppThemes {
  static const Color _primaryColor = Color(0xFFF04C23);
  static const Color _primaryDisabledColor = Color(0xFFFDCBBC);
  static const Color _aquaColor = Color(0xFF00B5AD);
  static const Color _aquaDisabledColor = Color(0xFFDCF2F1);
  static const Color _lightTextColor = Color(0xFF2C378E);
  static const Color _lightTextDisabledColor = Colors.grey;
  static const Color _inputTextColor = Color(0xFF995336);
  static const Color _buttonTextColor = Colors.white;
  static const Color _bodyTextColor = Color(0xFF2C378E);

  static Color get primaryDisabledColor => _primaryDisabledColor;
  static Color get aquaColor => _aquaColor;
  static Color get aquaDisabledColor => _aquaDisabledColor;
  static Color get lightTextColor => _lightTextColor;
  static Color get lightTextDisabledColor => _lightTextDisabledColor;

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 32.0, color: _lightTextColor, fontWeight: FontWeight.w900),
    bodyText1: TextStyle(fontSize: 16.0, color: _lightTextColor, fontWeight: FontWeight.w700),
    bodyText2: TextStyle(fontSize: 16.0, color: _bodyTextColor, fontWeight: FontWeight.w700),
    button: TextStyle(fontSize: 16.0, color: _buttonTextColor, fontWeight: FontWeight.w600),
    headline6: TextStyle(fontSize: 16.0, color: _lightTextColor),
    subtitle1: TextStyle(fontSize: 14.0, color: _inputTextColor),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: _primaryColor,
    textTheme: _lightTextTheme,
  );
}
