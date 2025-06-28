import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Montserrat',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: const Color(0xFFF7F9FB),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF374151)),
      bodyMedium: TextStyle(color: Color(0xFF374151)),
    ),
  );
} 