import 'package:flutter/material.dart';
import '../../app_bar/widgets/portfolio_app_bar.dart';
import '../widgets/single_page_portfolio.dart';
import '../../app_bar/widgets/section_navigation_dots.dart';
import '../widgets/social_icons.dart';
import '../../../core/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const PortfolioAppBar(),
    body: Stack(
      children: [
        SinglePagePortfolio(
          sections: [
            // Home (dark grey)
            const ColoredBox(
              color: AppColors.darkGrey,
              child: Center(child: Text('HOME')),
            ),
            // About (light grey)
            const _SectionWithCopyright(
              color: AppColors.lightGrey,
              label: 'ABOUT',
            ),
            // Work (dark grey)
            const _SectionWithCopyright(
              color: AppColors.darkGrey,
              label: 'WORK',
            ),
            // Skills (light grey)
            const _SectionWithCopyright(
              color: AppColors.lightGrey,
              label: 'SKILLS',
            ),
            // Reviews (dark grey)
            const _SectionWithCopyright(
              color: AppColors.darkGrey,
              label: 'REVIEWS',
            ),
            // Contact (light grey)
            const _SectionWithCopyright(
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

class _SectionWithCopyright extends StatelessWidget {
  final Color color;
  final String label;
  const _SectionWithCopyright({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Stack(
        children: [
          Center(child: Text(label)),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24, bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        '©',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '2025 MAHMOUD BAKIR',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'ALL RIGHTS RESERVED',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 