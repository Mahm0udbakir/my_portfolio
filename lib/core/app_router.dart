import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/app_bar/bloc/app_bar_bloc.dart';
import '../features/home/pages/home_page.dart';
import '../features/about/pages/about_page.dart';
import '../features/work/pages/work_page.dart';
import '../features/skills/pages/skills_page.dart';
import '../features/contact/pages/contact_page.dart';
import '../features/reviews/pages/reviews_page.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => BlocProvider<AppBarBloc>(
        create: (_) => AppBarBloc(),
        child: child,
      ),
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