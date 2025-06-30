import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/cubit/app_bar_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/cubit/side_menu_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/animation/animated_main_transform.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/animation/animated_side_menu_positioned.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/side_menu.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/custom_app_bar.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/copyright_tag.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/scroller.dart';
import 'package:my_portfolio/features/about/views/about_page.dart';
import 'package:my_portfolio/features/home/views/home_page.dart';
import 'package:my_portfolio/features/work/views/work_page.dart';
import 'package:my_portfolio/features/skills/views/skills_page.dart';
import 'package:my_portfolio/features/contact/views/contact_page.dart';
import 'package:my_portfolio/features/reviews/views/reviews_page.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/section_navigation_dots.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/social_icons.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

class AnimatedMainLayout extends StatefulWidget {
  const AnimatedMainLayout({Key? key}) : super(key: key);

  static const double maxOffsetFraction = 0.7;

  @override
  State<AnimatedMainLayout> createState() => _AnimatedMainLayoutState();
}

class _AnimatedMainLayoutState extends State<AnimatedMainLayout> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translateAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _translateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final maxOffset = MediaQuery.of(context).size.width * AnimatedMainLayout.maxOffsetFraction;
    return BlocListener<AppBarCubit, AppBarState>(
      listener: (context, state) {
        final isClosed = state.maybeWhen(
          sideMenuState: (isClosed, _) => isClosed,
          orElse: () => true,
        );
        if (isClosed) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      },
      child: BlocProvider<SideMenuCubit>(
        create: (context) => SideMenuCubit(),
        child: Stack(
          children: [
            AnimatedSideMenuPositioned(
              isMobile: isMobile,
              isClosed: context.select((AppBarCubit cubit) => cubit.state.maybeWhen(sideMenuState: (isClosed, _) => isClosed, orElse: () => true)),
              maxOffset: maxOffset,
              child: SideMenu(),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return AnimatedMainTransform(
                  translateAnimation: _translateAnimation,
                  scaleAnimation: _scaleAnimation,
                  animationController: _animationController,
                  maxOffset: maxOffset,
                  child: Scaffold(
                    appBar: CustomAppBar(),
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
                );
              },
            ),
            if (isMobile)
              Positioned(
                top: 16,
                right: 24,
                child: BlocBuilder<AppBarCubit, AppBarState>(
                  builder: (context, state) {
                    final isClosed = state.maybeWhen(
                      sideMenuState: (isClosed, _) => isClosed,
                      orElse: () => true,
                    );
                    return IconButton(
                      icon: Icon(
                        isClosed ? Icons.menu : Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.read<AppBarCubit>().toggleSideMenu();
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
} 