import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey,
      child: Center(child: Text('About')),
    );
  }
} 