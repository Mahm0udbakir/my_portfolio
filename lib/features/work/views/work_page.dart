import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Center(child: Text('Work')),
    );
  }
} 