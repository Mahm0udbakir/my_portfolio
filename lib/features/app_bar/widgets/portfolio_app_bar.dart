import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_bar/bloc/app_bar_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortfolioAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<_NavItem> navItems = const [
    _NavItem('Home', 0),
    _NavItem('About', 1),
    _NavItem('Work', 2),
    _NavItem('Skills', 3),
    _NavItem('Reviews', 4),
    _NavItem('Contact', 5),
  ];

  const PortfolioAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          color: Colors.white.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: preferredSize.height,
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 800;
              final selectedIndex = context.select<AppBarBloc, int>((bloc) {
                final state = bloc.state;
                return state.maybeWhen(section: (i) => i, orElse: () => 0);
              });
              return Row(
                children: [
                  // Home button (BAKIR) on the left
                  InkWell(
                    onTap: () => context.read<AppBarBloc>().add(AppBarEvent.sectionChanged(0)),
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
                          children: navItems.map((item) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                                  ),
                                  onPressed: () => context.read<AppBarBloc>().add(AppBarEvent.sectionChanged(item.index)),
                                  child: Text(
                                    item.label,
                                    style: TextStyle(
                                      color: selectedIndex == item.index ? Colors.blue[700] : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )).toList(),
                        ),
                      ),
                    ),
                  if (isMobile) const Spacer(),
                  // Hamburger menu on the top right (mobile only)
                  if (isMobile)
                    Builder(
                      builder: (context) => GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                            ),
                            builder: (_) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: navItems.map((item) => ListTile(
                                    title: Text(
                                      item.label,
                                      style: TextStyle(
                                        color: selectedIndex == item.index ? Colors.blue[700] : Colors.grey,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                      context.read<AppBarBloc>().add(AppBarEvent.sectionChanged(item.index));
                                    },
                                  )).toList(),
                            ),
                          );
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(FontAwesomeIcons.equals, color: Colors.white, size: 28),
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

class _NavItem {
  final String label;
  final int index;
  const _NavItem(this.label, this.index);
}
