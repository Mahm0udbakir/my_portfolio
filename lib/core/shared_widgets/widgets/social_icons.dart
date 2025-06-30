import 'package:flutter/material.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/functions.dart';
import '../constants/social_links.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/social_icon.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    if (!isMobile) {
      // Desktop/web: vertical column, positioned
      return Positioned(
        left: 24,
        bottom: 24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final link in kSocialLinks) ...[
              SocialIcon(icon: link.icon, onTap: () => launchIt(link.url)),
              const SizedBox(height: 4),
            ],
          ],
        ),
      );
    }
    return SizedBox();
  }
}
