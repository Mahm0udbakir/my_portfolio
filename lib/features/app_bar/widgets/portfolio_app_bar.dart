import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/features/app_bar/widgets/show_nav_sheet.dart';
import '../../app_bar/bloc/app_bar_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortfolioAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<NavItem> navItems = const [
    NavItem('Home', 0),
    NavItem('About', 1),
    NavItem('Work', 2),
    NavItem('Skills', 3),
    NavItem('Reviews', 4),
    NavItem('Contact', 5),
  ];

  const PortfolioAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
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
                  // Home button (BAKIR) on the left
                  InkWell(
                    onTap: () => context.read<AppBarCubit>().changeSection(0),
                    child: Text(
                      'BAKIR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.blue[700],
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  // Centered navigation options (web/tablet)
                  if (!isMobile)
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:
                              navItems
                                  .map(
                                    (item) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          overlayColor: WidgetStateProperty.all(
                                            Colors.transparent,
                                          ),
                                        ),
                                        onPressed:
                                            () => context
                                                .read<AppBarCubit>()
                                                .changeSection(item.index),
                                        child: Text(
                                          item.label,
                                          style: TextStyle(
                                            color:
                                                selectedIndex == item.index
                                                    ? Colors.blue[700]
                                                    : Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
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
                                color: Colors.blue[700],
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

class NavItem {
  final String label;
  final int index;
  const NavItem(this.label, this.index);
}


