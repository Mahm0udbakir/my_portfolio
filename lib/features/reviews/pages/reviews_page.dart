import 'package:flutter/material.dart';
import '../../app_bar/widgets/portfolio_app_bar.dart';
import '../../app_bar/widgets/section_navigation_dots.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const PortfolioAppBar(),
    body: Stack(
      children: [
        const Center(child: Text('REVIEWS')),
        const SectionNavigationDots(),
      ],
    ),
  );
} 