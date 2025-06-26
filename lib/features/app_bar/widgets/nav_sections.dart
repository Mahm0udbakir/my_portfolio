import 'package:flutter/material.dart';
import 'package:my_portfolio/core/app_colors.dart';
import 'package:my_portfolio/features/app_bar/widgets/nav_item.dart';

class NavSections extends StatelessWidget {
  final List<NavItem> navItems;
  final int selectedIndex;
  final void Function(int) onNavItemTap;

  const NavSections({
    super.key,
    required this.navItems,
    required this.selectedIndex,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: navItems
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () => onNavItemTap(item.index),
                    child: Text(
                      item.label,
                      style: TextStyle(
                        color: selectedIndex == item.index
                            ? AppColors.primary
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
    );
  }
} 