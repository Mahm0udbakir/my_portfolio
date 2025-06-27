import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/widgets/show_nav_sheet.dart';


class MobileMenuButton extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onSectionSelected;

  const MobileMenuButton({
    super.key,
    required this.selectedIndex,
    required this.onSectionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          showNavSheet(context, selectedIndex, (i) {
            onSectionSelected(i);
          });
        },
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
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
    );
  }
} 