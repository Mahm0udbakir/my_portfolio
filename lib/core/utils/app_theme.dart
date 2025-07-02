import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

class AppTheme {
  static const String _fontFamily = 'Montserrat';
  static const Color _textColor = Color(0xFF374151);
  static const Color _scaffoldBackground = Color(0xFFF7F9FB);

  static ThemeData get lightTheme => ThemeData(
    fontFamily: _fontFamily,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: _scaffoldBackground,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: _textColor),
      bodyMedium: TextStyle(color: _textColor),
    ),
  );

  static ThemeData get darkTheme => lightTheme;
}
