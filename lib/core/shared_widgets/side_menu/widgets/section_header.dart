import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  static const Color _textColor = Colors.white;
  static const FontWeight _fontWeight = FontWeight.bold;
  static const double _fontSize = 18.0;
  static const double _letterSpacing = 1.2;

  final String text;

  const SectionHeader({
    super.key, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: _textColor,
        fontWeight: _fontWeight,
        fontSize: _fontSize,
        letterSpacing: _letterSpacing,
      ),
    );
  }
} 