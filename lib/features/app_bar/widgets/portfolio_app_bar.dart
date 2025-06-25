import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          color: Colors.white.withValues(alpha: 0.4),
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
                          children: navItems.map((item) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: TextButton(
                                  style: ButtonStyle(
                                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                                  ),
                                  onPressed: () => context.read<AppBarCubit>().changeSection(item.index),
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
                            child: Icon(FontAwesomeIcons.equals, color: Colors.white, size: 22),
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

void showNavSheet(BuildContext context, int selectedIndex, Function(int) onTap) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final width = MediaQuery.of(context).size.width;
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 90,
                    maxWidth: width < 500 ? width * 0.40 : 220,
                  ),
                  child: IntrinsicWidth(
                    child: _NavSheet(selectedIndex: selectedIndex, onTap: onTap),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class _NavSheet extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<String> items = ['Home', 'About', 'Work', 'Skills', 'Reviews', 'Contact'];
  final List<IconData> icons = [
    FontAwesomeIcons.houseChimney, // Home
    FontAwesomeIcons.userLarge,    // About
    FontAwesomeIcons.briefcase,    // Work
    FontAwesomeIcons.screwdriverWrench, // Skills
    FontAwesomeIcons.solidCommentDots,  // Reviews
    FontAwesomeIcons.paperPlane,   // Contact
  ];

 _NavSheet({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.7),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 24,
                offset: Offset(0, -8),
              ),
            ],
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                margin: EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              ...List.generate(items.length, (i) {
                final isSelected = i == selectedIndex;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  margin: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.pop(context);
                      onTap(i);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icons[i],
                            color: isSelected ? Colors.blue : Colors.grey[700],
                            size: 20,
                          ),
                          SizedBox(height: 6),
                          Text(
                            items[i],
                            style: TextStyle(
                              color: isSelected ? Colors.blue : Colors.grey[800],
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
