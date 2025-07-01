import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/cubit/app_bar_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/cubit/side_menu_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/copyright_tag.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/scroller.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';
import 'package:my_portfolio/features/about/views/about_page.dart';
import 'package:my_portfolio/features/home/views/home_page.dart';
import 'package:my_portfolio/features/work/views/work_page.dart';
import 'package:my_portfolio/features/skills/views/skills_page.dart';
import 'package:my_portfolio/features/contact/views/contact_page.dart';
import 'package:my_portfolio/features/reviews/views/reviews_page.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/custom_app_bar.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/section_navigation_dots.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/social_icons.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/side_menu.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/animation/animated_main_transform.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/animation/animated_side_menu_positioned.dart';

class HomeShell extends StatelessWidget {
  static const double maxOffsetFraction = 0.7;
  final AnimationController animationController;
  final Animation<double> translateAnimation;
  final Animation<double> scaleAnimation;
  final bool isClosed;

  const HomeShell({
    super.key,
    required this.animationController,
    required this.translateAnimation,
    required this.scaleAnimation,
    required this.isClosed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final maxOffset =
        MediaQuery.of(context).size.width * HomeShell.maxOffsetFraction;
    return Container(
      color: const Color(0xff021c4d),
      child: BlocProvider<SideMenuCubit>(
        create: (context) => SideMenuCubit(),
        child: Stack(
          children: [
            AnimatedSideMenuPositioned(
              isMobile: isMobile,
              isClosed: isClosed,
              maxOffset: maxOffset,
              child: SideMenu(),
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return AnimatedMainTransform(
                  translateAnimation: translateAnimation,
                  scaleAnimation: scaleAnimation,
                  animationController: animationController,
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
                        color: isClosed ? AppColors.primary : Colors.white,
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
