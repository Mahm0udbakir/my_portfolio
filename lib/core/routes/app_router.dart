import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/shared_widgets/animation/home_shell_animation_controller.dart';
import 'package:my_portfolio/features/about/views/about_page.dart';
import 'package:my_portfolio/features/home/views/home_page.dart';
import 'package:my_portfolio/features/work/views/work_page.dart';
import 'package:my_portfolio/features/skills/views/skills_page.dart';
import 'package:my_portfolio/features/contact/views/contact_page.dart';
import 'package:my_portfolio/features/reviews/views/reviews_page.dart';

/// Route paths for the portfolio application.
/// 
/// Centralizes all route path definitions to avoid magic strings
/// and make route management more maintainable.
class PortfolioRoutes {
  static const String home = '/';
  static const String about = 'about';
  static const String work = 'work';
  static const String skills = 'skills';
  static const String reviews = 'reviews';
  static const String contact = 'contact';
  
  // Private constructor to prevent instantiation
  PortfolioRoutes._();
}

/// Main router configuration for the portfolio application.
/// 
/// Defines the navigation structure and route mappings using GoRouter.
/// This router uses a shell route pattern to provide consistent
/// layout and animations across all pages.
final portfolioRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeShellAnimationController(),
      routes: [
        GoRoute(
          path: PortfolioRoutes.home,
          builder: (context, state) => const HomePage(),
          routes: _buildFeatureRoutes(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => _buildErrorPage(context, state),
);

/// Builds the feature routes for the portfolio sections.
/// 
/// Returns a list of GoRoute objects for each feature page.
/// This method separates route creation logic for better maintainability.
List<GoRoute> _buildFeatureRoutes() {
  return [
    GoRoute(
      path: PortfolioRoutes.about,
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: PortfolioRoutes.work,
      builder: (context, state) => const WorkPage(),
    ),
    GoRoute(
      path: PortfolioRoutes.skills,
      builder: (context, state) => const SkillsPage(),
    ),
    GoRoute(
      path: PortfolioRoutes.reviews,
      builder: (context, state) => const ReviewsPage(),
    ),
    GoRoute(
      path: PortfolioRoutes.contact,
      builder: (context, state) => const ContactPage(),
    ),
  ];
}

/// Builds an error page for handling 404 and other routing errors.
/// 
/// [context] - The build context
/// [state] - The router state containing error information
/// Returns a widget representing the error page
Widget _buildErrorPage(BuildContext context, GoRouterState state) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Page Not Found'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Page not found: ${state.uri.path}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go(PortfolioRoutes.home),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  );
} 