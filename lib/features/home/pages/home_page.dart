import 'package:flutter/material.dart';
import '../../app_bar/widgets/custom_app_bar.dart';
import '../widgets/single_page_portfolio.dart';
import '../../app_bar/widgets/section_navigation_dots.dart';
import '../widgets/social_icons.dart';
import '../../../core/app_colors.dart';
import 'section_with_copyright.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    extendBodyBehindAppBar: true,
    body: Stack(
      children: [
        SinglePagePortfolio(
          sections: [
            const ColoredBox(
              color: AppColors.grey,
              child: Center(child: Text('HOME')),
            ),
            const SectionWithCopyright(
              color: AppColors.white,
              label: 'ABOUT',
            ),
            const SectionWithCopyright(
              color: AppColors.grey,
              label: 'WORK',
            ),
            const SectionWithCopyright(
              color: AppColors.white,
              label: 'SKILLS',
            ),
            const SectionWithCopyright(
              color: AppColors.grey,
              label: 'REVIEWS',
            ),
            const SectionWithCopyright(
              color: AppColors.white,
              label: 'CONTACT',
            ),
          ],
        ),
        const SectionNavigationDots(),
        const SocialIcons(),
        const Align(
          alignment: Alignment.topCenter,
          child: CustomAppBar(),
        ),
      ],
    ),
  );
} 