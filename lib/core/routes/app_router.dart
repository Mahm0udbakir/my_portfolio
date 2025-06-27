import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/bloc/app_bar_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/copyright_tag.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/scroller.dart';
import 'package:my_portfolio/features/about/views/about_page.dart';
import '../../features/home/views/home_page.dart';
import '../../features/work/views/work_page.dart';
import '../../features/skills/views/skills_page.dart';
import '../../features/contact/views/contact_page.dart';
import '../../features/reviews/views/reviews_page.dart';
import '../shared_widgets/app_bar/widgets/custom_app_bar.dart';
import '../shared_widgets/widgets/section_navigation_dots.dart';
import '../shared_widgets/widgets/social_icons.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder:
          (context, state, child) => BlocProvider<AppBarCubit>(
            create: (_) => AppBarCubit(),
            child: Scaffold(
              appBar: const CustomAppBar(),
              body: Stack(
                children: [
                  Scroller(
                    sections: [
                      HomePage(),
                      CopyrightsTag(child: AboutPage()),
                      CopyrightsTag(child: WorkPage()),
                      CopyrightsTag(child: SkillsPage()),
                      CopyrightsTag(child: ReviewsPage()),
                      CopyrightsTag(child: ContactPage()),
                    ],
                  ),
                  const SectionNavigationDots(),
                  const SocialIcons(),

                ],
              ),
            ),
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
