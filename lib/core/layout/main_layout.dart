import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/mobile_menu_button.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/animation/animated_side_menu_container.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/animation/main_3d_content_transform.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/cubit/side_menu_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/side_menu.dart';
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

/// Main layout component that orchestrates the portfolio application structure.
/// 
/// This widget manages the overall layout including:
/// - Side menu with animations
/// - Main content area with 3D transformations
/// - Responsive design for mobile/desktop
/// - Navigation structure
class MainLayout extends StatelessWidget {
  static const double _mobileBreakpoint = 800.0;
  static const double _maxOffsetFraction = 0.7;
  
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
    final maxOffset = _calculateMaxOffset(context);
    
    return Container(
      color: AppColors.darkBlue,
      child: BlocProvider<SideMenuCubit>(
        create: (context) => SideMenuCubit(),
        child: Stack(
          children: [
            _buildSideMenu(isMobile, maxOffset),
            _buildMainContent(context, maxOffset),
            if (isMobile) _buildMobileMenuButton(),
          ],
        ),
      ),
    );
  }

  bool _isMobileLayout(BuildContext context) {
    return MediaQuery.of(context).size.width < _mobileBreakpoint;
  }

  double _calculateMaxOffset(BuildContext context) {
    return MediaQuery.of(context).size.width * _maxOffsetFraction;
  }

  Widget _buildSideMenu(bool isMobile, double maxOffset) {
    return AnimatedSideMenuContainer(
      isMobile: isMobile,
      isClosed: isMenuClosed,
      maxOffset: maxOffset,
      child: SideMenu(),
    );
  }

  Widget _buildMainContent(BuildContext context, double maxOffset) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Main3DAnimation(
          translateAnimation: translateAnimation,
          scaleAnimation: scaleAnimation,
          animationController: animationController,
          maxOffset: maxOffset,
          child: _buildScaffold(),
        );
      },
    );
  }

  Widget _buildScaffold() {
    return Scaffold(
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
    return Scroller(
      sections: _getPageSections(),
    );
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