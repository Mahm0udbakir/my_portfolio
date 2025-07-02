import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../app_bar/cubit/app_bar_cubit.dart';
import '../../utils/app_colors.dart';
import '../constants/navigation_dots.dart';

class NavigationDots extends StatelessWidget {
  static const double _mobileBreakpoint = 800.0;
  static const double _rightPosition = 32.0;
  static const double _dotSize = 8.0;
  static const double _dotSpacing = 16.0;
  static const double _inactiveDotOpacity = 0.3;

  const NavigationDots({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < _mobileBreakpoint;
    if (isMobile) return const SizedBox.shrink();

    return Positioned(
      right: _rightPosition,
      top: 0,
      bottom: 0,
      child: Center(
        child: BlocBuilder<AppBarCubit, AppBarState>(
          builder: (context, state) {
            final selectedIndex = _getSelectedIndex(state);
            return _buildDotIndicator(context, selectedIndex);
          },
        ),
      ),
    );
  }

  int _getSelectedIndex(AppBarState state) {
    return state.maybeWhen(
      section: (index) => index,
      sideMenuState: (_, sectionIndex) => sectionIndex,
      orElse: () => 0,
    );
  }

  Widget _buildDotIndicator(BuildContext context, int selectedIndex) {
    return AnimatedSmoothIndicator(
      activeIndex: selectedIndex,
      count: kNavigationSectionNames.length,
      axisDirection: Axis.vertical,
      effect: WormEffect(
        dotHeight: _dotSize,
        dotWidth: _dotSize,
        activeDotColor: AppColors.primary,
        dotColor: AppColors.primary.withValues(alpha: _inactiveDotOpacity),
        spacing: _dotSpacing,
      ),
      onDotClicked: (index) {
        context.read<AppBarCubit>().changeSection(index);
      },
    );
  }
} 