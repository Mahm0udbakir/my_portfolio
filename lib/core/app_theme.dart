import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Montserrat',
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: const Color(0xFFF7F9FB),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF374151)),
      bodyMedium: TextStyle(color: Color(0xFF374151)),
    ),
  );
} 