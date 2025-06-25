import 'package:flutter/material.dart';
import '../../app_bar/widgets/portfolio_app_bar.dart';
import '../widgets/single_page_portfolio.dart';
import '../../app_bar/widgets/section_navigation_dots.dart';
import '../widgets/social_icons.dart';
import '../../../core/app_colors.dart';
import 'section_with_copyright.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const PortfolioAppBar(),
    body: Stack(
      children: [
        SinglePagePortfolio(
          sections: [
            const ColoredBox(
              color: AppColors.darkGrey,
              child: Center(child: Text('HOME')),
            ),
            const SectionWithCopyright(
              color: AppColors.lightGrey,
              label: 'ABOUT',
            ),
            const SectionWithCopyright(
              color: AppColors.darkGrey,
              label: 'WORK',
            ),
            const SectionWithCopyright(
              color: AppColors.lightGrey,
              label: 'SKILLS',
            ),
            const SectionWithCopyright(
              color: AppColors.darkGrey,
              label: 'REVIEWS',
            ),
            const SectionWithCopyright(
              color: AppColors.lightGrey,
              label: 'CONTACT',
            ),
          ],
        ),
        const SectionNavigationDots(),
        const SocialIcons(),
      ],
    ),
  );
} 