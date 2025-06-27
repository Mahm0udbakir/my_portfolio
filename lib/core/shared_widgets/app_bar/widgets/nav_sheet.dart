import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/utils/text_styles.dart';
import 'package:my_portfolio/core/utils/strings.dart';

class NavSheet extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<String> items = [
    MyAppStrings.navHome,
    MyAppStrings.navAbout,
    MyAppStrings.navWork,
    MyAppStrings.navSkills,
    MyAppStrings.navReviews,
    MyAppStrings.navContact,
  ];
  final List<IconData> icons = [
    FontAwesomeIcons.houseChimney,
    FontAwesomeIcons.userLarge,
    FontAwesomeIcons.briefcase,
    FontAwesomeIcons.screwdriverWrench,
    FontAwesomeIcons.solidCommentDots,
    FontAwesomeIcons.paperPlane,
  ];

  NavSheet({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          ...List.generate(items.length, (i) {
            final isSelected = i == selectedIndex;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 18),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  onTap(i);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[i],
                      color: isSelected ? Colors.blue : Colors.grey[700],
                      size: 20,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      items[i],
                      style: isSelected
                          ? MyTextStyles.montserrat70016primary
                          : MyTextStyles.montserrat40016grey,
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
