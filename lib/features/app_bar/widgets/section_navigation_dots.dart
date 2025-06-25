import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../bloc/app_bar_bloc.dart';
import '../../../core/app_colors.dart';

/// Navigation dot data
class SectionNavDot {
  final String label;
  final int index;
  const SectionNavDot(this.label, this.index);
}

class SectionNavigationDots extends StatelessWidget {
  const SectionNavigationDots({super.key});

  static const int dotCount = 6;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    if (isMobile) return const SizedBox.shrink();

    return Positioned(
      right: 32,
      top: 0,
      bottom: 0,
      child: Center(
        child: BlocBuilder<AppBarBloc, AppBarState>(
          builder: (context, state) {
            int selectedIndex = 0;
            state.maybeWhen(
              section: (index) => selectedIndex = index,
              orElse: () {},
            );
            return AnimatedSmoothIndicator(
              activeIndex: selectedIndex,
              count: dotCount,
              axisDirection: Axis.vertical,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: AppColors.primaryBlue,
                dotColor: AppColors.primaryBlue.withOpacity(0.3),
                spacing: 16,
              ),
              onDotClicked: (index) {
                context.read<AppBarBloc>().add(AppBarEvent.sectionChanged(index));
              },
            );
          },
        ),
      ),
    );
  }
} 