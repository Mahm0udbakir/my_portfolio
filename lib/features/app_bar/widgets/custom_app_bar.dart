import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/app_colors.dart';
import 'package:my_portfolio/features/app_bar/widgets/logo_button.dart';
import 'package:my_portfolio/features/app_bar/widgets/nav_item.dart';
import 'package:my_portfolio/features/app_bar/widgets/show_nav_sheet.dart';
import '../../app_bar/bloc/app_bar_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/features/app_bar/widgets/nav_sections.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<NavItem> navItems = const [
    NavItem('Home', 0),
    NavItem('About', 1),
    NavItem('Work', 2),
    NavItem('Skills', 3),
    NavItem('Reviews', 4),
    NavItem('Contact', 5),
  ];

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: preferredSize.height,
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 800;
              final selectedIndex = context.select<AppBarCubit, int>((cubit) {
                final state = cubit.state;
                return state.maybeWhen(section: (i) => i, orElse: () => 0);
              });
              return Row(
                children: [
                  const LogoButton(),
                  if (!isMobile)
                    NavSections(
                      navItems: navItems,
                      selectedIndex: selectedIndex,
                      onNavItemTap: (index) => context.read<AppBarCubit>().changeSection(index),
                    ),
                  if (isMobile) const Spacer(),
                  // Hamburger menu on the top right (mobile only)
                  if (isMobile)
                    Builder(
                      builder:
                          (context) => GestureDetector(
                            onTap: () {
                              showNavSheet(context, selectedIndex, (i) {
                                context.read<AppBarCubit>().changeSection(i);
                              });
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withValues(alpha: 0.15),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(
                                  FontAwesomeIcons.equals,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
