import 'package:flutter/material.dart';
import '../../app_bar/widgets/custom_app_bar.dart';
import '../../app_bar/widgets/section_navigation_dots.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(),
    body: Stack(
      children: [
        const Center(child: Text('ABOUT')),
        const SectionNavigationDots(),
      ],
    ),
  );
} 