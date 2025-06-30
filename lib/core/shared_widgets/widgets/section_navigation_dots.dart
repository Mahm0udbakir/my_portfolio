import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../app_bar/cubit/app_bar_cubit.dart';
import '../../utils/app_colors.dart';
import '../constants/navigation_dots.dart';

class SectionNavigationDots extends StatelessWidget {
  const SectionNavigationDots({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    if (isMobile) return const SizedBox.shrink();

    return Positioned(
      right: 32,
      top: 0,
      bottom: 0,
      child: Center(
        child: BlocBuilder<AppBarCubit, AppBarState>(
          builder: (context, state) {
            int selectedIndex = 0;
            state.maybeWhen(
              section: (index) => selectedIndex = index,
              sideMenuState: (_, sectionIndex) => selectedIndex = sectionIndex,
              orElse: () {},
            );
            return AnimatedSmoothIndicator(
              activeIndex: selectedIndex,
              count: kSectionNames.length,
              axisDirection: Axis.vertical,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: AppColors.primary,
                dotColor: AppColors.primary.withValues(alpha: 0.3),
                spacing: 16,
              ),
              onDotClicked: (index) {
                context.read<AppBarCubit>().changeSection(index);
              },
            );
          },
        ),
      ),
    );
  }
} 