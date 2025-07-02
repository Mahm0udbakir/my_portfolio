import 'package:flutter/material.dart';
import 'package:my_portfolio/core/shared_widgets/models/navigation_section.dart';
import 'package:my_portfolio/core/utils/text_styles.dart';

class AppBarSections extends StatelessWidget {
  final List<Section> navItems;
  final int selectedIndex;
  final void Function(int) onNavItemTap;

  const AppBarSections({
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
                      style: selectedIndex == item.index
                          ? MyTextStyles.montserrat60016primary
                          : MyTextStyles.montserrat40016grey,
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