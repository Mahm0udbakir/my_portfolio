import 'package:flutter/material.dart';

class SocialMediaIcon extends StatelessWidget {
  static const double _borderRadius = 24.0;
  static const double _padding = 10.0;
  static const double _iconSize = 20.0;
  
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const SocialMediaIcon({
    super.key,
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(_padding),
        child: Icon(
          icon, 
          color: color ?? Colors.grey[700], 
          size: _iconSize,
        ),
      ),
    );
  }
} 