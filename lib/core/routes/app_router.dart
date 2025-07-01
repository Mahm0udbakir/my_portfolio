import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/animation/home_shell_animation_controller.dart';
import 'package:my_portfolio/features/about/views/about_page.dart';
import '../../features/home/views/home_page.dart';
import '../../features/work/views/work_page.dart';
import '../../features/skills/views/skills_page.dart';
import '../../features/contact/views/contact_page.dart';
import '../../features/reviews/views/reviews_page.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeShellAnimationController(),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'about',
              builder: (context, state) => const AboutPage(),
            ),
            GoRoute(
              path: 'work',
              builder: (context, state) => const WorkPage(),
            ),
            GoRoute(
              path: 'skills',
              builder: (context, state) => const SkillsPage(),
            ),
            GoRoute(
              path: 'reviews',
              builder: (context, state) => const ReviewsPage(),
            ),
            GoRoute(
              path: 'contact',
              builder: (context, state) => const ContactPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
