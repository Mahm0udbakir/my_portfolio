import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/mobile_menu_button.dart';
import 'package:my_portfolio/core/animation/side_menu_animation.dart';
import 'package:my_portfolio/core/animation/main_layout_animation.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/cubit/side_menu_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/side_menu.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/copyright_tag.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/scroller.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';
import 'package:my_portfolio/features/about/views/about_section.dart';
import 'package:my_portfolio/features/home/views/home_section.dart';
import 'package:my_portfolio/features/work/views/work_section.dart';
import 'package:my_portfolio/features/skills/views/skills_section.dart';
import 'package:my_portfolio/features/contact/views/contact_section.dart';
import 'package:my_portfolio/features/reviews/views/reviews_section.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/custom_app_bar.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/section_navigation_dots.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/social_icons.dart';

/// Main layout component that orchestrates the portfolio application structure.
///
/// This widget manages the overall layout including:
/// - Side menu with animations
/// - Main content area with 3D transformations
/// - Responsive design for mobile/desktop
/// - Navigation structure
class MainLayout extends StatelessWidget {
  static const double _mobileBreakpoint = 800.0;

  final AnimationController animationController;
  final Animation<double> translateAnimation;
  final Animation<double> scaleAnimation;
  final bool isMenuClosed;

  const MainLayout({
    super.key,
    required this.animationController,
    required this.translateAnimation,
    required this.scaleAnimation,
    required this.isMenuClosed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = _isMobileLayout(context);
    final double sideMenuWidth = MediaQuery.of(context).size.width * 0.65;
    final double mainContentOffset = sideMenuWidth;

    return Container(
      color: AppColors.darkBlue,
      child: BlocProvider<SideMenuCubit>(
        create: (context) => SideMenuCubit(),
        child: Stack(
          children: [
            _buildSideMenu(isMobile, sideMenuWidth),
            _buildMainContent(context, mainContentOffset),
            if (isMobile) _buildMobileMenuButton(),
          ],
        ),
      ),
    );
  }

  bool _isMobileLayout(BuildContext context) {
    return MediaQuery.of(context).size.width < _mobileBreakpoint;
  }

  Widget _buildSideMenu(bool isMobile, double sideMenuWidth) {
    return SideMenuAnimation(
      isMobile: isMobile,
      isClosed: isMenuClosed,
      maxOffset: sideMenuWidth,
      child: SideMenu(),
    );
  }

  Widget _buildMainContent(BuildContext context, double mainContentOffset) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return MainLayoutAnimation(
          translateAnimation: translateAnimation,
          scaleAnimation: scaleAnimation,
          animationController: animationController,
          maxOffset: mainContentOffset,
          child: _buildScaffold(),
        );
      },
    );
  }

  Widget _buildScaffold() {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          _buildPageScroller(),
          const NavigationDots(),
          const SocialMediaLinks(),
        ],
      ),
    );
  }

  Widget _buildPageScroller() {
    return Scroller(sections: _getPageSections());
  }

  List<Widget> _getPageSections() {
    return [
      HomeSection(),
      CopyrightTag(child: AboutSection()),
      CopyrightTag(child: WorkSection()),
      CopyrightTag(child: SkillsSection()),
      CopyrightTag(child: ReviewsSection()),
      CopyrightTag(child: ContactSection()),
    ];
  }

  Widget _buildMobileMenuButton() {
    return MobileMenuButton(isClosed: isMenuClosed);
  }
}
