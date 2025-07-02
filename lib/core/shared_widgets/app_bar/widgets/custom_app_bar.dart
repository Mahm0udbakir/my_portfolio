import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/logo_button.dart';
import 'package:my_portfolio/core/shared_widgets/models/navigation_section.dart';
import '../cubit/app_bar_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/app_bar_sections.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double _mobileBreakpoint = 800.0;
  static const double _appBarHeight = 64.0;
  static const EdgeInsets _horizontalPadding = EdgeInsets.symmetric(horizontal: 24);
  
  final List<Section> navItems = const [
    Section('Home', 0),
    Section('About', 1),
    Section('Work', 2),
    Section('Skills', 3),
    Section('Reviews', 4),
    Section('Contact', 5),
  ];

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          padding: _horizontalPadding,
          height: preferredSize.height,
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < _mobileBreakpoint;
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_appBarHeight);
}
