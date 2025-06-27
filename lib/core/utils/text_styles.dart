import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

abstract class MyTextStyles {
  // Logo/title: Montserrat, Bold (700), size 28
  static const TextStyle montserrat70028primary = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    fontSize: 28,
    color: AppColors.primary, // Replace with AppColors.primary if needed
    letterSpacing: 2,
  );

  // Section/page title: Montserrat, Bold (700), size 24
  static const TextStyle montserrat70024black = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Colors.black,
  );

  // Copyright: Montserrat, Medium (500), size 14
  static const TextStyle montserrat50014black = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black,
  );

  // Copyright symbol: Montserrat, Medium (500), size 20
  static const TextStyle montserrat50020black = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: Colors.black,
  );

  // All rights reserved: Montserrat, Regular (400), size 13
  static const TextStyle montserrat40013black = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Colors.black,
  );

  // Navigation item selected: Montserrat, SemiBold (600), size 16
  static const TextStyle montserrat60016primary = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.primary, // Replace with AppColors.primary if needed
  );


  // Navigation sheet selected: Montserrat, Bold (700), size 16
  static const TextStyle montserrat70016primary = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.primary,
  );

  // Navigation sheet unselected: Montserrat, Normal (400), size 16
  static const TextStyle montserrat40016grey = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.grey,
  );
}