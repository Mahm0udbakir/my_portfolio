import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/logo_button.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/nav_item.dart';
import '../cubit/app_bar_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/nav_sections.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<NavItem> navItems = const [
    NavItem('Home', 0),
    NavItem('About', 1),
    NavItem('Work', 2),
    NavItem('Skills', 3),
    NavItem('Reviews', 4),
    NavItem('Contact', 5),
  ];

  final void Function(bool isClosed)? onMenuToggle;

  const CustomAppBar({super.key, this.onMenuToggle});

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
                return state.maybeWhen(
                  section: (i) => i,
                  sideMenuState: (_, sectionIndex) => sectionIndex,
                  orElse: () => 0,
                );
              });
              return Row(
                children: [
                  const LogoButton(),
                  if (!isMobile)
                    AppBarSections(
                      navItems: navItems,
                      selectedIndex: selectedIndex,
                      onNavItemTap: (index) => context.read<AppBarCubit>().changeSection(index),
                    ),
                  // Hamburger menu on the top right (mobile only)
                  const Spacer(),
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
