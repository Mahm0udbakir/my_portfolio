import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    extendBodyBehindAppBar: true,
    body: Container(
      color: AppColors.white,
      child: Center(child: Text('Home')),
    ),
  );
} 